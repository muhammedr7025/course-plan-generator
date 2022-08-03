import 'dart:convert';
import 'dart:developer';

import 'package:automated_course_plan_generator/constant/constants.dart';
import 'package:automated_course_plan_generator/main.dart';
import 'package:automated_course_plan_generator/model/classroom_model.dart';
import 'package:automated_course_plan_generator/model/create_class_model.dart';
import 'package:http/http.dart' as http;

class ClassroomRepositry {
  Future<List<ClassroomModel>> getClassroom() async {
    final token = prefs.getString('token');
    http.Response response = await http.get(
      Uri.parse(apiAddress + classroom),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Connection': 'keep-alive',
        'Authorization': 'Token $token',
      },
    );
    log('token=> $token');
    log(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        print('here');
        final data = json.decode(response.body) as List;
        print(data);
        var res = data.map((value) => ClassroomModel.fromJson(value)).toList();
        print('resposs =>$data');
        return res;
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteClassroom({required String url}) async {
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

  Future<List<ClassroomModel>> createClassroom(
      {required CreateClassModel classroomModel}) async {
    final token = prefs.getString('token');
    http.Response response = await http.post(Uri.parse(apiAddress + classroom),
        headers: {
          'Authorization': 'Token $token',
        },
        body: classroomModel.toJson());
    print(classroomModel.toJson());
    try {
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print('here');
        final data = json.decode(response.body) as List;
        print(data);
        var res = data.map((value) => ClassroomModel.fromJson(value)).toList();
        print('resposs =>$data');
        return res;
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e);
    }
  }
}
