import 'dart:convert';
import 'dart:developer';

import 'package:automated_course_plan_generator/constant/constants.dart';
import 'package:automated_course_plan_generator/main.dart';
import 'package:automated_course_plan_generator/model/teacher_response_model.dart';
import 'package:automated_course_plan_generator/model/teaching_model.dart';

import 'package:http/http.dart' as http;

class TeachingRepositor {
  Future<List<TeachingResponseModel>> getteaching() async {
    final token = prefs.getString('token');
    http.Response response =
        await http.get(Uri.parse(apiAddress + teaching), headers: {
      'Authorization': 'Token $token',
    });
    log("log response =>" + response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        print('here');
        final data = json.decode(response.body) as List;
        print('resposs =>$data');
        var res =
            data.map((value) => TeachingResponseModel.fromJson(value)).toList();
        return res;
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> createClassroom({TeachingModel? teachingMap}) async {
    final token = prefs.getString('token');
    http.Response response =
        await http.post(Uri.parse(apiAddress + teaching), headers: {
      'Authorization': 'Token $token',
    }, body: {
      "teacher": "http://34.222.29.103/users/6/",
      "course": "http://34.222.29.103/courses/CST304/",
      "classroom": "http://34.222.29.103/classroom/s6/",
      "periods": {
        "0": [4, 6],
        "1": [0],
        "2": [1, 2],
        "3": [5],
        "4": [5]
      },
    });
    // var formdata = FormData.fromMap({
    //   "teacher": "http://34.222.29.103/users/12/",
    //   "course": "http://34.222.29.103/courses/CST304/",
    //   "classroom": "http://34.222.29.103/classroom/s6/",
    //   "periods": {
    //     "0": [4, 6],
    //     "1": [0],
    //     "2": [1, 2],
    //     "3": [5],
    //     "4": [5]
    //   },
    // });
    // print(formdata.toString());
    // Response response = await Dio().post(apiAddress + teaching,
    //     data: formdata,
    //     options: Options(
    //       headers: {
    //         'Authorization': 'Token $token',
    //       },
    //     ));
    // print(response.statusCode);
    try {
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        log('response=>${response.body}');
      }
      // throw Exception(response.statusMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  deleteteaching({required String url}) async {
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
