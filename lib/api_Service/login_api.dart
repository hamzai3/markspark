import 'dart:convert';

import 'package:markshark_mvc/api_Service/apiconfig.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/model/login_model.dart';
import 'package:markshark_mvc/model/select_gender_model.dart';


class LoginApi {
  static Future<LoginModel> fetchProfile(String userName, String password) async {
    String path = base_url + login_path;
    var header = {
      'Content-Type': 'application/x-www-form-urlencoded',      
    };

    Map<String, String> body = {
      "request": "user_login",
      "email": userName,
      "password": password,

    };


    final response = await Apiconfig.post(path, header, body);
    print('fetchProfile resp $response');

    if (response['status'] == 'failed') {
      // Fluttertoast.showToast(
      //     msg: "Something went wrong",
      //     textColor: BLACK_COLOR,
      //     backgroundColor: GREY_COLOR);
      
      return null;
    } else {
      // return ProfileModel.fromJson(response);
      return loginModelFromJson(json.encode(response));
    }
  }
  static Future<SelectGenderModel> storeGender(String userEmail, String gender) async {
    String path = base_url + login_path;
    var header = {
      'Content-Type': 'application/x-www-form-urlencoded',      
    };

    Map<String, String> body = {
      "request": "user_gender",
      "gender": gender,
      "email": userEmail,

    };


    final response = await Apiconfig.post(path, header, body);
    print('storeGender body $body');
    print('storeGender resp $response');

    if (response['status'] == 'failed') {
      // Fluttertoast.showToast(
      //     msg: "Something went wrong",
      //     textColor: BLACK_COLOR,
      //     backgroundColor: GREY_COLOR);
      
      return null;
    } else {
      // return ProfileModel.fromJson(response);
      return selectGenderModelFromJson(json.encode(response));
    }
  }
}
