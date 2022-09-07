import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/auth/email_sign_object.dart';
import 'package:dartz/dartz.dart';
import 'package:instructify/domain/firebase/i_firebase_cloud.dart';
import 'package:instructify/model/user.dart' as AppUser;
import 'package:instructify/domain/auth/i_auth_facade.dart';
import 'package:instructify/domain/core/auth_failure.dart';
import 'package:instructify/domain/auth/password_sign_object.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
import 'package:instructify/model/user.dart' as model;

@LazySingleton(as: IAuthFacade)
class AuthFirebase implements IAuthFacade {
  final FirebaseAuth _auth;
  final IFirebaseCloud _firebaseCloud;
  final GoogleSignIn _googleSignIn;
  AuthFirebase(this._auth, this._googleSignIn,this._firebaseCloud);

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
      AppUser.User tempUser = AppUser.User(
        userId: userTemp?.user?.uid,
        email: userTemp!.user!.email.toString(),
        type: 'student',
        fullName: userTemp!.user!.email.toString(),
      );
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
  Future<Either<AuthFailure, Unit>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
