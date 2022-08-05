import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/auth/email_sign_object.dart';
import 'package:dartz/dartz.dart';
import 'package:instructify/domain/auth/i_auth_facade.dart';
import 'package:instructify/domain/core/auth_failure.dart';
import 'package:instructify/domain/auth/password_sign_object.dart';
import 'package:instructify/model/user.dart' as model;

@LazySingleton(as: IAuthFacade)
class AuthFirebase implements IAuthFacade {
  final FirebaseAuth? _auth;
  final GoogleSignIn? _googleSignIn;
  AuthFirebase({FirebaseAuth? auth, GoogleSignIn? googleSignIn})
      : _auth = auth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String imgUrl,
      required EmailSignObject emailAddress,
      required PasswordSignObject password}) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
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
          ?.signInWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr)
          .then((value) => userTemp = value);
      // model.User(email: );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {  
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      return left(const AuthFailure.serverError());
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
