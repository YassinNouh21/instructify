import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/auth/email_sign_object.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:instructify/domain/firebase/i_firebase_cloud.dart';
import 'package:instructify/model/user.dart' as AppUser;
import 'package:instructify/domain/auth/i_auth_facade.dart';
import 'package:instructify/domain/core/auth_failure.dart';
import 'package:instructify/domain/auth/password_sign_object.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';

@LazySingleton(as: IAuthFacade)
class AuthFirebase implements IAuthFacade {
  final FirebaseAuth _auth;
  final IFirebaseCloud _firebaseCloud;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;
  AuthFirebase(
      this._auth, this._googleSignIn, this._firebaseCloud, this._firestore);

  @override
  Future<Either<AuthFailure, UserCredential>> registerWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      UserCredential? userTemp = await _auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      return right(userTemp);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.getFailure(e.code));
    } catch (e) {
      return left(const ServerError());
    }
  }

  @override
  Future<Either<AuthFailure, AppUser.User>> getUserFromCloud(
      String userId) async {
    try {
      return await _firestore
          .collection('users')
          .doc(userId.substring(0, 20))
          .get()
          .then((value) {
        return right(AppUser.User.fromMap(value.data()!));
      });
    } catch (e) {
      return left(const CancelledByUser());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailSignObject emailAddress,
      required PasswordSignObject password}) async {
    final emailAddressStr = emailAddress.getUnExpectedFailure();
    final passwordStr = password.getUnExpectedFailure();
    try {
      UserCredential? userTemp;
      await _auth
          .signInWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr)
          .then((value) => userTemp = value);
      late AppUser.User temp;
      await getUserFromCloud(userTemp!.user!.uid)
          .then((value) => value.fold((l) => [], (r) {
                debugPrint('r: $r');
                temp = r;
              }));
      AppUser.User tempUser = AppUser.User(
        userId: userTemp?.user?.uid,
        email: userTemp!.user!.email.toString(),
        type: 'student',
        fullName: temp.fullName,
        favoriteCourses: temp.favoriteCourses,
      );
      debugPrint('tempUser: $tempUser');
      await PreferenceRepository.pref
          .setString('user', jsonDecode(json.encode(tempUser)));
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.getFailure(e.code));
    } catch (e) {
      return left(const ServerError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      // debugPrint('user: top');

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // debugPrint('user: GoogleSignInAccount');

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // debugPrint('user: start');

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      AppUser.User tempUser = AppUser.User(
        userId: user.user?.uid,
        email: user.user!.email.toString(),
        type: 'student',
        fullName: user.user!.displayName.toString(),
        favoriteCourses: const [],
      );
      await _firebaseCloud.registerUser(tempUser).then((value) => value.fold(
          (l) => throw (const ServerError()),
          (r) => PreferenceRepository.pref
              .setString('user', jsonDecode(json.encode(tempUser)))));
      // debugPrint('temp User ${tempUser}');
      return right(unit);
    } catch (e) {
      // debugPrint('user: $e');
      return left(const ServerError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithFacebook() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      debugPrint('user: ${FirebaseAuth.instance.currentUser}');
      return right(unit);
    } catch (e) {
      debugPrint('signOut: $e');
      return left(const ServerError());
    }
  }
}
