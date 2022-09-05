import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/core/auth_failure.dart';

import 'package:instructify/domain/core/cloud_failure.dart';
import 'package:instructify/domain/firebase/i_firebase_cloud.dart';
import 'package:instructify/model/category.dart';
import 'package:instructify/model/course.dart';
import 'package:instructify/model/user.dart';

@LazySingleton(as: IFirebaseCloud)
class CloudRepository implements IFirebaseCloud {
  final FirebaseFirestore _firestore;
  CloudRepository(this._firestore);

  @override
  Future<Either<CloudFailure, List<Course>>> getCourses() async {
    try {
      return await _firestore.collection('courses').get().then((value) {
        return right(value.docs.map((e) {
          Map<String, dynamic> courseJson = e.data();
          return Course.fromMap(courseJson);
        }).toList());
      });
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_INVALID_ARGUMENT') {
        return left(const CloudFailure.objectNotFound());
      } else {
        return left(const CloudFailure.objectServerError());
      }
    } catch (e) {
      return left(const CloudFailure.unkown());
    }
  }

  @override
  Future<Either<CloudFailure, List<Category>>> getCategories() async {
    try {
      return await _firestore.collection('categories').get().then((value) {
        return right(value.docs.map((e) {
          Map<String, dynamic> categoryJson = e.data();
          return Category.fromMap(categoryJson);
        }).toList());
      });
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_INVALID_ARGUMENT') {
        return left(const CloudFailure.objectNotFound());
      } else {
        return left(const CloudFailure.objectServerError());
      }
    } catch (e) {
      return left(const CloudFailure.unkown());
    }
  }

  @override
  Future<Either<CloudFailure, Unit>> registerUser(User user) async {
    try {
      await _firestore.collection('users').add(user.toMap());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_INVALID_ARGUMENT') {
        return left(const CloudFailure.objectNotFound());
      } else {
        return left(const CloudFailure.objectServerError());
      }
    } catch (e) {
      return left(const CloudFailure.unkown());
    }
  }

  @override
  Future<Either<CloudFailure, Unit>> updateUser(User user) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.userId)
          .update(user.toMap());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_INVALID_ARGUMENT') {
        return left(const CloudFailure.objectNotFound());
      } else {
        return left(const CloudFailure.objectServerError());
      }
    } catch (e) {
      return left(const CloudFailure.unkown());
    }
  }

  @override
  Future<Either<CloudFailure, List<Course>>> searchByCategory(
      List<String> coursesId) async {
    try {
      List<Course> courses = [];
      for (String courseId in coursesId) {
        final course = await _firestore
            .collection('courses')
            .doc(courseId)
            .get()
            .then((value) {
          Map<String, dynamic> courseJson = value.data()!;
          return Course.fromMap(courseJson);
        });
        courses.add(course);
      }

      return right(courses);
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_INVALID_ARGUMENT') {
        return left(CloudFailure.objectNotFound());
      } else {
        return left(CloudFailure.objectServerError());
      }
    } catch (e) {
      ('cloud Error: searchByCategory $e');
      return left(const CloudFailure.unkown());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> addCourseToUser(
      String courseId, User user) async {
    try {
      // await _firestore.collection('users').doc(user.userId).update({
      //   'courses': FieldValue.arrayUnion([courseId])
      // });
      List<PurshasedCourses>? purshasedCourses = user.purshasedCourses;
      purshasedCourses!.add(PurshasedCourses(courseId: courseId));
      User newUser = user.copyWith(purshasedCourses: purshasedCourses);
      await _firestore
          .collection('users')
          .doc(user.userId)
          .update(newUser.toMap());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_INVALID_ARGUMENT') {
        return left(const CancelledByUser());
      }
      return left(const ServerError());
    } catch (e) {
      return left(const ServerError());
    }
  }
}
