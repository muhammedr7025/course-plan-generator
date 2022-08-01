// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.expiry,
    required this.token,
  });

  DateTime expiry;
  String token;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        expiry: DateTime.parse(json["expiry"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "expiry": expiry.toIso8601String(),
        "token": token,
      };
}
