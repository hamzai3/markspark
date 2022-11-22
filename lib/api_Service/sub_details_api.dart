import 'dart:convert';

import 'package:markshark_mvc/api_Service/apiconfig.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/model/subject_details_model.dart';


class SubjectApi {
  static Future<SubjectDetailsModel> fetchSubject(String userID) async {
    String path = base_url + select_subject_path;
    var header = {
      'Content-Type': 'application/x-www-form-urlencoded',      
    };

    Map<String, String> body = {
      "request": "user_subject_details",      
      "id" : userID,
    };


    final response = await Apiconfig.post(path, header, body);
    print('fetchSubject resp $response');    

    if (response['status'] == 'failed') {
      // Fluttertoast.showToast(
      //     msg: "Something went wrong",
      //     textColor: BLACK_COLOR,
      //     backgroundColor: GREY_COLOR);
      
      return null;
    } else {
      // return ProfileModel.fromJson(response);
      return subjectDetailsModelFromJson(json.encode(response));
    }
  }
}
