// To parse this JSON data, do
//
//     final teachingResponseModel = teachingResponseModelFromJson(jsonString);

import 'dart:convert';

List<TeachingResponseModel> teachingResponseModelFromJson(String str) =>
    List<TeachingResponseModel>.from(
        json.decode(str).map((x) => TeachingResponseModel.fromJson(x)));

String teachingResponseModelToJson(List<TeachingResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  dynamic periods;

  factory TeachingResponseModel.fromJson(Map<String, dynamic> json) =>
      TeachingResponseModel(
        url: json["url"],
        teacher: json["teacher"],
        course: json["course"],
        classroom: json["classroom"],
        periods: json["periods"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "teacher": teacher,
        "course": course,
        "classroom": classroom,
        "periods": periods,
      };
}

class Period {
  Period({
    required this.the0,
  });

  List<int> the0;

  factory Period.fromJson(Map<String, dynamic> json) => Period(
        the0: List<int>.from(json["0"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "0": List<dynamic>.from(the0.map((x) => x)),
      };
}
