// To parse this JSON data, do
//
//     final staffCreateModel = staffCreateModelFromJson(jsonString);

import 'dart:convert';

StaffCreateModel staffCreateModelFromJson(String str) =>
    StaffCreateModel.fromJson(json.decode(str));

String staffCreateModelToJson(StaffCreateModel data) =>
    json.encode(data.toJson());

class StaffCreateModel {
  StaffCreateModel({
    required this.url,
    required this.username,
  });

  String url;
  String username;

  factory StaffCreateModel.fromJson(Map<String, dynamic> json) =>
      StaffCreateModel(
        url: json["url"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "username": username,
      };
}
