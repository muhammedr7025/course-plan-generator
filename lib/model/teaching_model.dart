// To parse this JSON data, do
//
//     final teachingModel = teachingModelFromJson(jsonString);

import 'dart:convert';

TeachingModel teachingModelFromJson(String str) =>
    TeachingModel.fromJson(json.decode(str));

String teachingModelToJson(TeachingModel data) => json.encode(data.toJson());

class TeachingModel {
  TeachingModel({
    required this.classroom,
    required this.course,
    required this.periods,
    required this.teacher,
  });

  String classroom;
  String course;
  Map<String, List<int>> periods;
  String teacher;

  factory TeachingModel.fromJson(Map<String, dynamic> json) => TeachingModel(
        classroom: json["classroom"],
        course: json["course"],
        periods: Map.from(json["periods"]).map((k, v) =>
            MapEntry<String, List<int>>(k, List<int>.from(v.map((x) => x)))),
        teacher: json["teacher"],
      );

  Map<String, dynamic> toJson() => {
        "classroom": classroom,
        "course": course,
        "periods": Map.from(periods).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "teacher": teacher,
      };
}
