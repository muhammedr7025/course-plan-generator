import 'dart:convert';
import 'dart:developer';

import 'package:automated_course_plan_generator/constant/constants.dart';
import 'package:automated_course_plan_generator/main.dart';
import 'package:automated_course_plan_generator/model/staff_create_model.dart';
import 'package:http/http.dart' as http;

class StaffRepositry {
  Future<StaffCreateModel> create(username, password) async {
    Map<String, dynamic> requestPayload = {
      "username": username,
      "password": password,
    };
    final request = jsonEncode(requestPayload);
    print(Uri.parse(apiAddress + '/users/'));
    http.Response response = await http.post(
      Uri.parse('$apiAddress/users/'),
      body: request,
      headers: {'Content-Type': 'application/json'},
    );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString());
        final data = json.decode(response.body);
        return StaffCreateModel.fromJson(data);
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<StaffCreateModel>> getStaff() async {
    http.Response response = await http.get(
      Uri.parse(apiAddress + '/users/'),
    );
    log(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        print('here');
        final data = json.decode(response.body) as List;
        print(data);
        var res =
            data.map((value) => StaffCreateModel.fromJson(value)).toList();
        print('resposs =>$data');
        return res;
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteStaff({required String url}) async {
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
