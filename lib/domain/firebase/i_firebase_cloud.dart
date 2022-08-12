import 'package:dartz/dartz.dart';
import 'package:instructify/domain/core/cloud_failure.dart';
import 'package:instructify/model/course.dart';
import 'package:instructify/model/user.dart';

abstract class IFirebaseCloud {
  Future<List<Course>> getCourses();
  Future<Either<CloudFailure, Unit>> registerUser(User user);
  Future<Either<CloudFailure, Unit>> updateUser(User user);
}
