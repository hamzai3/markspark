import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markshark_mvc/api_Service/apiconfig.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';

import 'package:markshark_mvc/model/register_model.dart';

class RegisterApi {
  static Future<RegisterModel> saveProfile(
      String userName, String email, String password) async {
    String path = base_url + register_path;
    var header = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    Map<String, String> body = {
      "request": "user_register",
      "name": userName,
      "email": email,
      "password": password,
    };

    final response = await Apiconfig.post(path, header, body);
    print('saveProfile resp $response');

    if (response['status'] == 'failed') {
      if (response['reason'] == 'email_exists') {
        Get.snackbar("Email already exists", "Try login",
            backgroundColor: Colors.red,
            colorText: white_color,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8));
      }
      else{
         Get.snackbar("Something went wrong", "Try again",
            backgroundColor: Colors.red,
            colorText: white_color,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8));
      }
      return null;
    } else {
      // return ProfileModel.fromJson(response);
      return registerModelFromJson(json.encode(response));
    }
  }
}
