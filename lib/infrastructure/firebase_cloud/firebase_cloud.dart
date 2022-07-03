import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:instructify/domain/firebase/firebase_cloud.dart';

import '../../domain/model/course.dart';

class CloudRepository implements IFirebaseCloud {
  final FirebaseFirestore _firestore;
  CloudRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Course>> getCourses() {
    return _firestore
        .collection('courses')
        .get()
        .then((value) => value.docs.map((e) {
          
              Map<String, dynamic> courseJson = e.data();
              return Course.fromMap(courseJson);
            }).toList());
  }
}
