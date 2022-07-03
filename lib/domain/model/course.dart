import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Content {
  final String topic;
  final String duration;
  Content({
    required this.topic,
    required this.duration,
  });

  Content copyWith({
    String? topic,
    String? duration,
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
      duration: map['duration'] ?? '',
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
  final String courseId;
  final String createdDate;
  final String courseName;
  final String instructor;
  final String teachingLanguage;
  final List<Content> content;
  final String imgUrl;
  final int duration;
  final int price;
  const Course({
    required this.courseId,
    required this.createdDate,
    required this.courseName,
    required this.instructor,
    required this.teachingLanguage,
    required this.content,
    required this.imgUrl,
    required this.duration,
    required this.price,
  });

  Course copyWith({
    String? courseId,
    String? createdDate,
    String? courseName,
    String? instructor,
    String? teachingLanguage,
    List<Content>? content,
    String? imgUrl,
    int? duration,
    int? price,
  }) {
    return Course(
      courseId: courseId ?? this.courseId,
      createdDate: createdDate ?? this.createdDate,
      courseName: courseName ?? this.courseName,
      instructor: instructor ?? this.instructor,
      teachingLanguage: teachingLanguage ?? this.teachingLanguage,
      content: content ?? this.content,
      imgUrl: imgUrl ?? this.imgUrl,
      duration: duration ?? this.duration,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'courseId': courseId});
    result.addAll({'createdDate': createdDate});
    result.addAll({'courseName': courseName});
    result.addAll({'instructor': instructor});
    result.addAll({'teachingLanguage': teachingLanguage});
    result.addAll({'content': content.map((x) => x.toMap()).toList()});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'duration': duration});
    result.addAll({'price': price});

    return result;
  }

  double convertMinutesToHours(int minutes) {
    return minutes / 60;
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseId: map['courseId'] ?? '',
      createdDate: map['createdDate'] ?? '',
      courseName: map['courseName'] ?? '',
      instructor: map['instructor'] ?? '',
      teachingLanguage: map['teachingLanguage'] ?? '',
      content:
          List<Content>.from(map['content']?.map((x) => Content.fromMap(x))),
      imgUrl: map['imgUrl'] ?? '',
      duration: map['duration'] ?? 0,
      price: map['price'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(courseId: $courseId, createdDate: $createdDate, courseName: $courseName, instructor: $instructor, teachingLanguage: $teachingLanguage, content: $content, imgUrl: $imgUrl, duration: $duration, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.courseId == courseId &&
        other.createdDate == createdDate &&
        other.courseName == courseName &&
        other.instructor == instructor &&
        other.teachingLanguage == teachingLanguage &&
        listEquals(other.content, content) &&
        other.imgUrl == imgUrl &&
        other.duration == duration &&
        other.price == price;
  }

  @override
  int get hashCode {
    return courseId.hashCode ^
        createdDate.hashCode ^
        courseName.hashCode ^
        instructor.hashCode ^
        teachingLanguage.hashCode ^
        content.hashCode ^
        imgUrl.hashCode ^
        duration.hashCode ^
        price.hashCode;
  }
}
