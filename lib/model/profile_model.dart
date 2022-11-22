// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        this.response,
    });

    List<Response> response;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        response: json["response"] == null ? null : List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response == null ? null : List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Response {
    Response({
        this.id,
        this.username,
        this.email,
        this.imageUrl,
        this.subjectCount,
        this.queCount,
        this.addedOn,
        this.status,
        this.reason,
    });

    String id;
    String username;
    String email;
    dynamic imageUrl;
    String subjectCount;
    String queCount;
    List<String> addedOn;
    String status;
    String reason;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        imageUrl: json["image_url"],
        subjectCount: json["subjectCount"] == null ? null : json["subjectCount"],
        queCount: json["queCount"] == null ? null : json["queCount"],
        addedOn: json["added_on"] == null ? null : List<String>.from(json["added_on"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
        reason: json["reason"] == null ? null : json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "image_url": imageUrl,
        "subjectCount": subjectCount == null ? null : subjectCount,
        "queCount": queCount == null ? null : queCount,
        "added_on": addedOn == null ? null : List<dynamic>.from(addedOn.map((x) => x)),
        "status": status == null ? null : status,
        "reason": reason == null ? null : reason,
    };
}
