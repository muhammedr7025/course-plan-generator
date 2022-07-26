import 'dart:convert';
import 'dart:developer';

import 'package:automated_course_plan_generator/constant/constants.dart';
import 'package:automated_course_plan_generator/main.dart';
import 'package:automated_course_plan_generator/model/course_model.dart';
import 'package:http/http.dart' as http;

class CourseRepositry {
  Future<List<CourseModel>> getCourses() async {
    http.Response response = await http.get(
      Uri.parse(apiAddress + coursePath),
    );
    log(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        print('here');
        final data = json.decode(response.body) as List;
        print(data);
        var res = data.map((value) => CourseModel.fromJson(value)).toList();
        print('resposs =>$data');
        return res;
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteCourse({required String url}) async {
    final token = prefs.getString('token');
    http.Response response = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Connection': 'keep-alive',
        'Authorization': 'Token $token',
      },
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 204) {
        log(response.statusCode.toString());
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
