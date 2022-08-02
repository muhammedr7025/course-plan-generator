import 'dart:convert';

List<ClassroomModel> classroomModelFromJson(String str) =>
    List<ClassroomModel>.from(
        json.decode(str).map((x) => ClassroomModel.fromJson(x)));

String classroomModelToJson(List<ClassroomModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClassroomModel {
  ClassroomModel({
    required this.name,
    required this.url,
    required this.startDate,
    required this.endDate,
    required this.weekHolidays,
    required this.customHolidays,
  });

  String name;
  String url;
  DateTime startDate;
  DateTime endDate;
  List<int> weekHolidays;
  String customHolidays;

  factory ClassroomModel.fromJson(Map<String, dynamic> json) => ClassroomModel(
        name: json["name"],
        url: json["url"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        weekHolidays: List<int>.from(json["week_holidays"].map((x) => x)),
        customHolidays: json["custom_holidays"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "week_holidays": List<dynamic>.from(weekHolidays.map((x) => x)),
        "custom_holidays": customHolidays,
      };
}
