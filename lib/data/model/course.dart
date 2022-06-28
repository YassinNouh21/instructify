import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Content {
  final String topic;
  final int duration;
  Content({
    required this.topic,
    required this.duration,
  });

  Content copyWith({
    String? topic,
    int? duration,
  }) {
    return Content(
      topic: topic ?? this.topic,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'topic': topic});
    result.addAll({'duration': duration});

    return result;
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      topic: map['topic'] ?? '',
      duration: map['duration']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) =>
      Content.fromMap(json.decode(source));

  @override
  String toString() => 'Content(topic: $topic, duration: $duration)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Content &&
        other.topic == topic &&
        other.duration == duration;
  }

  @override
  int get hashCode => topic.hashCode ^ duration.hashCode;
}

@immutable
class Course {
  final int courseId;
  final String createdDate;
  final String courseName;
  final String instructor;
  final int duration;
  final int price;
  final String teachingLanguage;
  final Content content;
  final String imgUrl;

  const Course({
    required this.courseId,
    required this.createdDate,
    required this.courseName,
    required this.instructor,
    required this.duration,
    required this.price,
    required this.teachingLanguage,
    required this.content,
    required this.imgUrl,
  });

  Course copyWith({
    int? courseId,
    String? createdDate,
    String? courseName,
    String? instructor,
    int? duration,
    int? price,
    String? teachingLanguage,
    Content? content,
    String? imgUrl,
  }) {
    return Course(
      courseId: courseId ?? this.courseId,
      createdDate: createdDate ?? this.createdDate,
      courseName: courseName ?? this.courseName,
      instructor: instructor ?? this.instructor,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      teachingLanguage: teachingLanguage ?? this.teachingLanguage,
      content: content ?? this.content,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'courseId': courseId});
    result.addAll({'createdDate': createdDate});
    result.addAll({'courseName': courseName});
    result.addAll({'instructor': instructor});
    result.addAll({'duration': duration});
    result.addAll({'price': price});
    result.addAll({'teachingLanguage': teachingLanguage});
    result.addAll({'content': content.toMap()});
    result.addAll({'imgUrl': imgUrl});

    return result;
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseId: map['courseId']?.toInt() ?? 0,
      createdDate: map['createdDate'] ?? '',
      courseName: map['courseName'] ?? '',
      instructor: map['instructor'] ?? '',
      duration: map['duration']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      teachingLanguage: map['teachingLanguage'] ?? '',
      content: Content.fromMap(map['content']),
      imgUrl: map['imgUrl'] ?? '',
    );
  }
  
  double convertMinutesToHours(int minutes) {
    return minutes / 60;
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(courseId: $courseId, createdDate: $createdDate, courseName: $courseName, instructor: $instructor, duration: $duration, price: $price, teachingLanguage: $teachingLanguage, content: $content, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.courseId == courseId &&
        other.createdDate == createdDate &&
        other.courseName == courseName &&
        other.instructor == instructor &&
        other.duration == duration &&
        other.price == price &&
        other.teachingLanguage == teachingLanguage &&
        other.content == content &&
        other.imgUrl == imgUrl;
  }

  @override
  int get hashCode {
    return courseId.hashCode ^
        createdDate.hashCode ^
        courseName.hashCode ^
        instructor.hashCode ^
        duration.hashCode ^
        price.hashCode ^
        teachingLanguage.hashCode ^
        content.hashCode ^
        imgUrl.hashCode;
  }
}
