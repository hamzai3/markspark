// To parse this JSON data, do
//
//     final subjectDetailsModel = subjectDetailsModelFromJson(jsonString);

import 'dart:convert';

SubjectDetailsModel subjectDetailsModelFromJson(String str) => SubjectDetailsModel.fromJson(json.decode(str));

String subjectDetailsModelToJson(SubjectDetailsModel data) => json.encode(data.toJson());

class SubjectDetailsModel {
    SubjectDetailsModel({
        this.response,
    });

    List<Response> response;

    factory SubjectDetailsModel.fromJson(Map<String, dynamic> json) => SubjectDetailsModel(
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
        this.subject,
    });

    String status;
    String reason;
    List<Subject> subject;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"] == null ? null : json["status"],
        reason: json["reason"] == null ? null : json["reason"],
        subject: json["subject"] == null ? null : List<Subject>.from(json["subject"].map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "reason": reason == null ? null : reason,
        "subject": subject == null ? null : List<dynamic>.from(subject.map((x) => x.toJson())),
    };
}

class Subject {
    Subject({
        this.subjectName,
        this.subjectImage,
        this.subjectId,
        this.subjectPercentage,
    });

    String subjectName;
    String subjectImage;
    String subjectId;
    int subjectPercentage;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subjectName: json["subject_name"] == null ? null : json["subject_name"],
        subjectImage: json["subject_image"] == null ? null : json["subject_image"],
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        subjectPercentage: json["subject_percentage"] == null ? null : json["subject_percentage"],
    );

    Map<String, dynamic> toJson() => {
        "subject_name": subjectName == null ? null : subjectName,
        "subject_image": subjectImage == null ? null : subjectImage,
        "subject_id": subjectId == null ? null : subjectId,
        "subject_percentage": subjectPercentage == null ? null : subjectPercentage,
    };
}
