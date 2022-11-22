import 'dart:convert';

import 'package:markshark_mvc/api_Service/apiconfig.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/model/profile_model.dart';

class ProfileApi {
  static Future<ProfileModel> fetchProfile(String userID) async {
    String path = base_url + profile_path;
    var header = {
      'Content-Type': 'application/x-www-form-urlencoded',      
    };

    Map<String, String> body = {
      "request": "user_details",
      "id": userID,
    };


    final response = await Apiconfig.post(path, header, body);
    print('fetchProfile resp $response');
    print('fetchProfile body $body');
    print('fetchProfile path $path');

    if (response['status'] == 'failed') {
      // Fluttertoast.showToast(
      //     msg: "Something went wrong",
      //     textColor: BLACK_COLOR,
      //     backgroundColor: GREY_COLOR);
      
      return null;
    } else {
      // return ProfileModel.fromJson(response);
      return profileModelFromJson(json.encode(response));
    }
  }
}
