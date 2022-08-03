import 'dart:convert';

List<CreateClassModel> classroomModelFromJson(String str) =>
    List<CreateClassModel>.from(
        json.decode(str).map((x) => CreateClassModel.fromJson(x)));

String classroomModelToJson(List<CreateClassModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateClassModel {
  CreateClassModel({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.weekHolidays,
    required this.customHolidays,
  });

  String name;
  String startDate;
  String endDate;
  List<int> weekHolidays;
  String customHolidays;

  factory CreateClassModel.fromJson(Map<String, dynamic> json) =>
      CreateClassModel(
        name: json["name"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        weekHolidays: List<int>.from(json["week_holidays"].map((x) => x)),
        customHolidays: json["custom_holidays"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "start_date": startDate,
        "end_date": endDate,
        "week_holidays":
            List<dynamic>.from(weekHolidays.map((x) => x)).toString(),
        "custom_holidays": customHolidays,
      };
}
