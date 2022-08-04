import 'dart:convert';

List<TeachingModel> teachingModelFromJson(String str) =>
    List<TeachingModel>.from(
        json.decode(str).map((x) => TeachingModel.fromJson(x)));

String teachingModelToJson(List<TeachingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeachingModel {
  TeachingModel({
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

  factory TeachingModel.fromJson(Map<String, dynamic> json) => TeachingModel(
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
