import 'package:dartz/dartz.dart';
import 'package:instructify/domain/core/cloud_failure.dart';
import 'package:instructify/model/course.dart';
import 'package:instructify/model/user.dart';

import '../../model/category.dart';

abstract class IFirebaseCloud {
  Future<Either<CloudFailure, List<Course>>> getCourses();
  Future<Either<CloudFailure, List<Category>>> getCategories();
  Future<Either<CloudFailure, List<Course>>> searchByCategory(
      List<String> coursesId);
  Future<Either<CloudFailure, Unit>> registerUser(User user);
  Future<Either<CloudFailure, Unit>> updateUser(User user);
}
