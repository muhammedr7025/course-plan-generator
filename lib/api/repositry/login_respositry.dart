import 'dart:convert';
import 'dart:developer';

import 'package:automated_course_plan_generator/constant/constants.dart';
import 'package:automated_course_plan_generator/main.dart';
import 'package:automated_course_plan_generator/model/login_response_model.dart';
import 'package:http/http.dart' as http;

class LoginRepositry {
  Future<LoginResponseModel> login(username, password) async {
    Map<String, dynamic> requestPayload = {
      "username": username,
      "password": password,
    };
    // final request = jsonEncode(requestPayload);
    print(Uri.parse(apiAddress + loginPath));
    http.Response response = await http.post(
      Uri.parse(apiAddress + loginPath),
      body: requestPayload,
      // headers: {'Content-Type': 'application/json'},
    );
    try {
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        final data = json.decode(response.body);
        String token = json.decode(response.body)['token'];
        prefs.setString('token', token);
        prefs.setBool('is_loggedIn', true);
        log('token => $token');
        return LoginResponseModel.fromJson(data);
      }
      throw Exception(response.reasonPhrase);
    } catch (e) {
      throw Exception(e);
    }
  }
}
