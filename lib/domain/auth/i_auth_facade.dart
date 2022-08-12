import 'package:dartz/dartz.dart';
import 'package:instructify/domain/auth/email_sign_object.dart';
import 'package:instructify/domain/auth/password_sign_object.dart';
import 'package:instructify/domain/core/auth_failure.dart';
import 'package:instructify/model/user.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailSignObject emailAddress,
    required PasswordSignObject password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<Either<AuthFailure, Unit>> signInWithFacebook();
}
