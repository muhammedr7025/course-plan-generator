// To parse this JSON data, do
//
//     final teachingModel = teachingModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

class TeachingModel {
  String classroom;
  String course;
  Map<String, List<int>> periods;
  String teacher;
  TeachingModel({
    required this.classroom,
    required this.course,
    required this.periods,
    required this.teacher,
  });

  TeachingModel copyWith({
    String? classroom,
    String? course,
    Map<String, List<int>>? periods,
    String? teacher,
  }) {
    return TeachingModel(
      classroom: classroom ?? this.classroom,
      course: course ?? this.course,
      periods: periods ?? this.periods,
      teacher: teacher ?? this.teacher,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'classroom': classroom,
      'course': course,
      'periods': periods,
      'teacher': teacher,
    };
  }

  factory TeachingModel.fromMap(Map<String, dynamic> map) {
    return TeachingModel(
      classroom: map['classroom'] ?? '',
      course: map['course'] ?? '',
      periods: Map<String, List<int>>.from(map['periods']),
      teacher: map['teacher'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TeachingModel.fromJson(String source) =>
      TeachingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TeachingModel(classroom: $classroom, course: $course, periods: $periods, teacher: $teacher)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeachingModel &&
        other.classroom == classroom &&
        other.course == course &&
        mapEquals(other.periods, periods) &&
        other.teacher == teacher;
  }

  @override
  int get hashCode {
    return classroom.hashCode ^
        course.hashCode ^
        periods.hashCode ^
        teacher.hashCode;
  }
}
