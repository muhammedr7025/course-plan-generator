import 'dart:convert';
import 'dart:developer';

import 'package:automated_course_plan_generator/constant/constants.dart';
import 'package:automated_course_plan_generator/main.dart';
import 'package:automated_course_plan_generator/model/teaching_model.dart';
import 'package:http/http.dart' as http;

class TeachingRepositor {
  Future<List<TeachingModel>> getClassroom() async {
    final token = prefs.getString('token');
    http.Response response =
        await http.get(Uri.parse(apiAddress + teaching), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    log(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        print('here');
        final data = json.decode(response.body) as List;
        print(data);
        var res = data.map((value) => TeachingModel.fromJson(value)).toList();
        print('resposs =>$data');
        return res;
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e);
    }
  }
}
