import 'dart:convert';

import 'package:markshark_mvc/api_Service/apiconfig.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/model/section_model.dart';


class SectionApi {
  static Future<SectionModel> fetchSection(String subjecId ) async {
    String path = base_url + get_Sections_path;
    var header = {
      'Content-Type': 'application/x-www-form-urlencoded',      
    };

    Map<String, String> body = {
      "request": "section",      
      "subject_id" : subjecId,
    };


    final response = await Apiconfig.post(path, header, body);
    print('fetchSection resp $response');    

    if (response['status'] == 'failed') {
      // Fluttertoast.showToast(
      //     msg: "Something went wrong",
      //     textColor: BLACK_COLOR,
      //     backgroundColor: GREY_COLOR);
      
      return null;
    } else {
      // return ProfileModel.fromJson(response);
      return sectionModelFromJson(json.encode(response));
    }
  }
}
