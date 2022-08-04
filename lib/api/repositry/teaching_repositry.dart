import 'dart:convert';
import 'dart:developer';

import 'package:automated_course_plan_generator/constant/constants.dart';
import 'package:automated_course_plan_generator/main.dart';
import 'package:automated_course_plan_generator/model/teacher_response_model.dart';
import 'package:automated_course_plan_generator/model/teaching_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class TeachingRepositor {
  Future<List<TeachingResponseModel>> getteaching() async {
    final token = prefs.getString('token');
    http.Response response =
        await http.get(Uri.parse(apiAddress + teaching), headers: {
      'Authorization': 'Token $token',
    });
    log(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        print('here');
        final data = json.decode(response.body) as List;
        print(data);
        var res =
            data.map((value) => TeachingResponseModel.fromJson(value)).toList();
        print('resposs =>$data');
        return res;
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e);
    }
  }

  createClassroom({required TeachingModel teachingMap}) async {
    final token = prefs.getString('token');
    // http.Response response = await http.post(Uri.parse(apiAddress + classroom),
    // headers: {
    // 'Authorization': 'Token $token',
    // },
    // body: teachingMap.toJson());\
    Response response = await Dio().post(apiAddress + classroom,
        data: FormData.fromMap({
          'classroom': teachingMap.classroom,
          'couerse': teachingMap.course,
          'periods': [teachingMap.periods],
          'teacher': teachingMap.teacher
        }),
        options: Options(
          headers: {
            'Authorization': 'Token $token',
          },
        ));
    print('here');
    try {
      log(response.statusCode.toString());
      log(response.data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        log('response=>${response.data}');
      }
      throw Exception(response.statusMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
