// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.response,
    });

    List<Response> response;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        response: json["response"] == null ? null : List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response == null ? null : List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Response {
    Response({
        this.username,
        this.email,
        this.gender,
        this.status,
        this.reason,
        this.id,
    });

    String username;
    String email;
    String gender;
    String status;
    String reason;
    String id;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        gender: json["gender"] == null ? null : json["gender"],
        status: json["status"] == null ? null : json["status"],
        reason: json["reason"] == null ? null : json["reason"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "gender": gender == null ? null : gender,
        "status": status == null ? null : status,
        "reason": reason == null ? null : reason,
        "id": id == null ? null : id,
    };
}
