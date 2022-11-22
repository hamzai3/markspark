import 'dart:convert';

import 'package:markshark_mvc/api_Service/apiconfig.dart';
import 'package:markshark_mvc/constants/expo_all_const.dart';
import 'package:markshark_mvc/model/after_answer_model.dart';
import 'package:markshark_mvc/model/ques_ans_model.dart';


class QueAnsApi {
  static Future<QuesAnsModel> fetchQuestion(String userID, String subjectId, String section) async {
    String path = base_url + question_answer_list_path;
    var header = {
      'Content-Type': 'application/x-www-form-urlencoded',      
    };

    Map<String, String> body = {
      "request": "question_choices_details",      
      "sub_id" : subjectId,
      "user_id" : userID,
      "section" : section,
    };


    final response = await Apiconfig.post(path, header, body);
    print('fetchQuestion resp $response');    

    if (response['status'] == 'failed') {
      // Fluttertoast.showToast(
      //     msg: "Something went wrong",
      //     textColor: BLACK_COLOR,
      //     backgroundColor: GREY_COLOR);
      
      return null;
    } else {      
      return quesAnsModelFromJson(json.encode(response));
    }
  }


  static afterAnswer(String userID, String subjectId, String questionId, String attempts) async {
    String path = base_url + after_answer_path;
    var header = {
      'Content-Type': 'application/x-www-form-urlencoded',      
    };

    Map<String, String> body = {
      "request": "answers",      
      "subject_id" : subjectId,
      "question_id" : questionId,
      "user_id" : userID,
      "attempts" : attempts,
    };


    final response = await Apiconfig.post(path, header, body);
    print('afterAnswer resp $response');    

    if (response['status'] == 'failed') {
      // Fluttertoast.showToast(
      //     msg: "Something went wrong",
      //     textColor: BLACK_COLOR,
      //     backgroundColor: GREY_COLOR);
      
      return null;
    } else {      
      return afterAnswerModelFromJson(json.encode(response));
    }
  }
}
