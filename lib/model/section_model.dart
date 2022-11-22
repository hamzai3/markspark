// To parse this JSON data, do
//
//     final sectionModel = sectionModelFromJson(jsonString);

import 'dart:convert';

SectionModel sectionModelFromJson(String str) => SectionModel.fromJson(json.decode(str));

String sectionModelToJson(SectionModel data) => json.encode(data.toJson());

class SectionModel {
    SectionModel({
        this.response,
    });

    List<Response> response;

    factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
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
        this.sections,
    });

    String status;
    String reason;
    List<String> sections;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"] == null ? null : json["status"],
        reason: json["reason"] == null ? null : json["reason"],
        sections: json["sections"] == null ? null : List<String>.from(json["sections"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "reason": reason == null ? null : reason,
        "sections": sections == null ? null : List<dynamic>.from(sections.map((x) => x)),
    };
}
