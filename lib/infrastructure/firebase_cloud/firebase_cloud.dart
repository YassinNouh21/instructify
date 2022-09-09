import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/core/auth_failure.dart';

import 'package:instructify/domain/core/cloud_failure.dart';
import 'package:instructify/domain/firebase/i_firebase_cloud.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
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
      await _firestore
          .collection('users')
          .doc(user.userId?.substring(0, 20))
          .set(user.toMap());
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
  Future<Either<CloudFailure, List<Course>>> searchByName(String name) async {
    try {
      List<Course> courses = [];

      await _firestore
          .collection('courses')
          .where('courseName', isGreaterThanOrEqualTo: name)
          .where('courseName', isLessThanOrEqualTo: name + 'z')
          // .where('courseName', isEqualTo: "Data Structures and Algorithms")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          courses = value.docs.map((e) {
            Map<String, dynamic> courseJson = e.data();
            return Course.fromMap(courseJson);
          }).toList();
        } else {
          throw const CloudFailure.objectNotFound();
        }
      });

      return right(courses);
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_INVALID_ARGUMENT') {
        return left(const CloudFailure.objectNotFound());
      }

      return left(const CloudFailure.objectNotFound());
    } catch (e) {
      if (e == const CloudFailure.objectNotFound()) {
        return left(const CloudFailure.objectNotFound());
      }
      return left(const CloudFailure.unkown());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> addFavoriteCourse(
      String courseId, String? userId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId?.substring(0, 20))
          .get()
          .then((value) => {
                // PreferenceRepository.pref.setString('user', User.fromMap( value.data()!).toJson()),
                if (value.exists)
                  {
                    _firestore
                        .collection('users')
                        .doc(userId?.substring(0, 20))
                        .update({
                      'favoriteCourses': FieldValue.arrayUnion([courseId])
                    })
                  }
              });

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

  @override
  Future<Either<AuthFailure, Unit>> removeFavoriteCourse(
      String courseId, String? userId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId?.substring(0, 20))
          .update({
        'favoriteCourses': FieldValue.arrayRemove([courseId])
      });
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
