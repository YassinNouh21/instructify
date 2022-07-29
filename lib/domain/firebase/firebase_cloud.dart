import 'package:instructify/model/course.dart';

abstract class IFirebaseCloud {
  Future<List<Course>> getCourses();
  
}
