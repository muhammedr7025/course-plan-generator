// To parse this JSON data, do
//
//     final teachingModel = teachingModelFromJson(jsonString);

import 'dart:convert';

TeachingResponseModel teachingModelFromJson(String str) =>
    TeachingResponseModel.fromJson(json.decode(str));

String teachingModelToJson(TeachingResponseModel data) =>
    json.encode(data.toJson());

class TeachingResponseModel {
  TeachingResponseModel({
    required this.url,
    required this.teacher,
    required this.course,
    required this.classroom,
    required this.periods,
  });

  String url;
  String teacher;
  String course;
  String classroom;
  Map<String, List<int>> periods;

  factory TeachingResponseModel.fromJson(Map<String, dynamic> json) =>
      TeachingResponseModel(
        url: json["url"],
        teacher: json["teacher"],
        course: json["course"],
        classroom: json["classroom"],
        periods: Map.from(json["periods"]).map((k, v) =>
            MapEntry<String, List<int>>(k, List<int>.from(v.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "teacher": teacher,
        "course": course,
        "classroom": classroom,
        "periods": Map.from(periods).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
      };
}
