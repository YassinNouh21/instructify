
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instructify/domain/model/course.dart';

abstract class IFirebaseCloud {
  Future<List<Course>> getCourses();
}