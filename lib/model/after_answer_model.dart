// To parse this JSON data, do
//
//     final afterAnswerModel = afterAnswerModelFromJson(jsonString);

import 'dart:convert';

AfterAnswerModel afterAnswerModelFromJson(String str) => AfterAnswerModel.fromJson(json.decode(str));

String afterAnswerModelToJson(AfterAnswerModel data) => json.encode(data.toJson());

class AfterAnswerModel {
    AfterAnswerModel({
        this.response,
    });

    List<Response> response;

    factory AfterAnswerModel.fromJson(Map<String, dynamic> json) => AfterAnswerModel(
        response: json["response"] == null ? null : List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response == null ? null : List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Response {
    Response({
        this.status,
        this.reason,
    });

    String status;
    String reason;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"] == null ? null : json["status"],
        reason: json["reason"] == null ? null : json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "reason": reason == null ? null : reason,
    };
}
