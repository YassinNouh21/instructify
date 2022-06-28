import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  final String userId;
  final String email;
  final String phoneNumber;
  final String type;
  final String imgUrl;
  final List<PurshasedCourses> purshasedCourses;
  final List<Progess> progess;
  final String fullName;
  User({
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.type,
    required this.imgUrl,
    required this.purshasedCourses,
    required this.progess,
    required this.fullName,
  });

  User copyWith({
    String? userId,
    String? email,
    String? phoneNumber,
    String? type,
    String? imgUrl,
    List<PurshasedCourses>? purshasedCourses,
    List<Progess>? progess,
    String? fullName,
  }) {
    return User(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      type: type ?? this.type,
      imgUrl: imgUrl ?? this.imgUrl,
      purshasedCourses: purshasedCourses ?? this.purshasedCourses,
      progess: progess ?? this.progess,
      fullName: fullName ?? this.fullName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userId': userId});
    result.addAll({'email': email});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'type': type});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'purshasedCourses': purshasedCourses.map((x) => x.toMap()).toList()});
    result.addAll({'progess': progess.map((x) => x.toMap()).toList()});
    result.addAll({'fullName': fullName});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      type: map['type'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      purshasedCourses: List<PurshasedCourses>.from(map['purshasedCourses']?.map((x) => PurshasedCourses.fromMap(x))),
      progess: List<Progess>.from(map['progess']?.map((x) => Progess.fromMap(x))),
      fullName: map['fullName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(userId: $userId, email: $email, phoneNumber: $phoneNumber, type: $type, imgUrl: $imgUrl, purshasedCourses: $purshasedCourses, progess: $progess, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.userId == userId &&
      other.email == email &&
      other.phoneNumber == phoneNumber &&
      other.type == type &&
      other.imgUrl == imgUrl &&
      listEquals(other.purshasedCourses, purshasedCourses) &&
      listEquals(other.progess, progess) &&
      other.fullName == fullName;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      type.hashCode ^
      imgUrl.hashCode ^
      purshasedCourses.hashCode ^
      progess.hashCode ^
      fullName.hashCode;
  }
}

class PurshasedCourses {
  final String courseId;
  PurshasedCourses({
    required this.courseId,
  });

  PurshasedCourses copyWith({
    String? courseId,
  }) {
    return PurshasedCourses(
      courseId: courseId ?? this.courseId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'courseId': courseId});

    return result;
  }

  factory PurshasedCourses.fromMap(Map<String, dynamic> map) {
    return PurshasedCourses(
      courseId: map['courseId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PurshasedCourses.fromJson(String source) =>
      PurshasedCourses.fromMap(json.decode(source));

  @override
  String toString() => 'PurshasedCourses(courseId: $courseId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PurshasedCourses && other.courseId == courseId;
  }

  @override
  int get hashCode => courseId.hashCode;
}

class Progess {
  final String courseId;
  final int finishedTime;
  Progess({
    required this.courseId,
    required this.finishedTime,
  });

  Progess copyWith({
    String? courseId,
    int? finishedTime,
  }) {
    return Progess(
      courseId: courseId ?? this.courseId,
      finishedTime: finishedTime ?? this.finishedTime,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'courseId': courseId});
    result.addAll({'finishedTime': finishedTime});

    return result;
  }

  factory Progess.fromMap(Map<String, dynamic> map) {
    return Progess(
      courseId: map['courseId'] ?? '',
      finishedTime: map['finishedTime']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Progess.fromJson(String source) =>
      Progess.fromMap(json.decode(source));

  @override
  String toString() =>
      'Progess(courseId: $courseId, finishedTime: $finishedTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Progess &&
        other.courseId == courseId &&
        other.finishedTime == finishedTime;
  }

  @override
  int get hashCode => courseId.hashCode ^ finishedTime.hashCode;
}
