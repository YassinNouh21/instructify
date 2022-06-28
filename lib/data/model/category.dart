import 'dart:convert';

import 'package:flutter/foundation.dart';

class Category {
  final String categoryId;
  final String name;
  final List<int> coursesId;
  final String imgUrl;
  const Category({
    required this.categoryId,
    required this.name,
    required this.coursesId,
    required this.imgUrl,
  });

  Category copyWith({
    String? categoryId,
    String? name,
    List<int>? coursesId,
    String? imgUrl,
  }) {
    return Category(
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      coursesId: coursesId ?? this.coursesId,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'categoryId': categoryId});
    result.addAll({'name': name});
    result.addAll({'coursesId': coursesId});
    result.addAll({'imgUrl': imgUrl});

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoryId: map['categoryId'] ?? '',
      name: map['name'] ?? '',
      coursesId: List<int>.from(map['coursesId']),
      imgUrl: map['imgUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(categoryId: $categoryId, name: $name, coursesId: $coursesId, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.categoryId == categoryId &&
        other.name == name &&
        listEquals(other.coursesId, coursesId) &&
        other.imgUrl == imgUrl;
  }

  @override
  int get hashCode {
    return categoryId.hashCode ^
        name.hashCode ^
        coursesId.hashCode ^
        imgUrl.hashCode;
  }
}
