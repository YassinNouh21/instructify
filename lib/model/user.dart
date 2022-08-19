import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class User {
  final String email;
  final String fullName;
  final String type;
  final String? userId;
  final String? phoneNumber;
  final List<PurshasedCourses>? purshasedCourses;
  final List<Progess>? progess;
  final String? imgUrl;
  const User({
    required this.email,
    required this.fullName,
    required this.type,
    this.userId,
    this.phoneNumber,
    this.purshasedCourses,
    this.progess,
    this.imgUrl,
  });

  User copyWith({
    String? email,
    String? fullName,
    String? type,
    String? userId,
    String? phoneNumber,
    List<PurshasedCourses>? purshasedCourses,
    List<Progess>? progess,
    String? imgUrl,
  }) {
    return User(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      purshasedCourses: purshasedCourses ?? this.purshasedCourses,
      progess: progess ?? this.progess,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'fullName': fullName});
    result.addAll({'type': type});
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (purshasedCourses != null) {
      result.addAll({
        'purshasedCourses': purshasedCourses!.map((x) => x?.toMap()).toList()
      });
    }
    if (progess != null) {
      result.addAll({'progess': progess!.map((x) => x?.toMap()).toList()});
    }
    if (imgUrl != null) {
      result.addAll({'imgUrl': imgUrl});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      type: map['type'] ?? '',
      userId: map['userId'],
      phoneNumber: map['phoneNumber'],
      purshasedCourses: map['purshasedCourses'] != null
          ? List<PurshasedCourses>.from(
              map['purshasedCourses']?.map((x) => PurshasedCourses.fromMap(x)))
          : null,
      progess: map['progess'] != null
          ? List<Progess>.from(map['progess']?.map((x) => Progess.fromMap(x)))
          : null,
      imgUrl: map['imgUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(email: $email, fullName: $fullName, type: $type, userId: $userId, phoneNumber: $phoneNumber, purshasedCourses: $purshasedCourses, progess: $progess, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.email == email &&
        other.fullName == fullName &&
        other.type == type &&
        other.userId == userId &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.purshasedCourses, purshasedCourses) &&
        listEquals(other.progess, progess) &&
        other.imgUrl == imgUrl;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        fullName.hashCode ^
        type.hashCode ^
        userId.hashCode ^
        phoneNumber.hashCode ^
        purshasedCourses.hashCode ^
        progess.hashCode ^
        imgUrl.hashCode;
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
