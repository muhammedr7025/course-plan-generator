import 'dart:convert';

List<CourseModel> courseModelFromJson(String str) => List<CourseModel>.from(
    json.decode(str).map((x) => CourseModel.fromJson(x)));

String courseModelToJson(List<CourseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseModel {
  CourseModel({
    required this.id,
    required this.url,
    required this.name,
    required this.modules,
  });

  String id;
  String url;
  String name;
  List<Module> modules;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "modules": List<dynamic>.from(modules.map((x) => x.toJson())),
      };
}

class Module {
  Module({
    required this.number,
    required this.name,
    required this.topics,
  });

  int number;
  String name;
  List<Topic> topics;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        number: json["number"],
        name: json["name"],
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "topics": List<dynamic>.from(topics.map((x) => x.toJson())),
      };
}

class Topic {
  Topic({
    required this.order,
    required this.name,
    required this.hours,
  });

  int order;
  String name;
  int hours;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        order: json["order"],
        name: json["name"],
        hours: json["hours"],
      );

  Map<String, dynamic> toJson() => {
        "order": order,
        "name": name,
        "hours": hours,
      };
}
