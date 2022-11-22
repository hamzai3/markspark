// To parse this JSON data, do
//
//     final leaderBoardModel = leaderBoardModelFromJson(jsonString);

import 'dart:convert';

LeaderBoardModel leaderBoardModelFromJson(String str) => LeaderBoardModel.fromJson(json.decode(str));

String leaderBoardModelToJson(LeaderBoardModel data) => json.encode(data.toJson());

class LeaderBoardModel {
    LeaderBoardModel({
        this.response,
    });

    List<Response> response;

    factory LeaderBoardModel.fromJson(Map<String, dynamic> json) => LeaderBoardModel(
        response: json["response"] == null ? null : List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response == null ? null : List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Response {
    Response({
        this.userId,
        this.score,
        this.top3RankArray,
        this.status,
        this.reason,
    });

    String userId;
    String score;
    List<Top3RankArray> top3RankArray;
    String status;
    String reason;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"] == null ? null : json["user_id"],
        score: json["score"] == null ? null : json["score"],
        top3RankArray: json["top_3_rank_array"] == null ? null : List<Top3RankArray>.from(json["top_3_rank_array"].map((x) => Top3RankArray.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        reason: json["reason"] == null ? null : json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "score": score == null ? null : score,
        "top_3_rank_array": top3RankArray == null ? null : List<dynamic>.from(top3RankArray.map((x) => x.toJson())),
        "status": status == null ? null : status,
        "reason": reason == null ? null : reason,
    };
}

class Top3RankArray {
    Top3RankArray({
        this.top3Rank,
        this.top3Score,
        this.top3UserId,
        this.top3Gender,
        this.top3Username,
    });

    int top3Rank;
    String top3Score;
    String top3UserId;
    dynamic top3Gender;
    String top3Username;

    factory Top3RankArray.fromJson(Map<String, dynamic> json) => Top3RankArray(
        top3Rank: json["top_3_rank"] == null ? null : json["top_3_rank"],
        top3Score: json["top_3_score"] == null ? null : json["top_3_score"],
        top3UserId: json["top_3_user_id"] == null ? null : json["top_3_user_id"],
        top3Gender: json["top_3_gender"],
        top3Username: json["top_3_username"] == null ? null : json["top_3_username"],
    );

    Map<String, dynamic> toJson() => {
        "top_3_rank": top3Rank == null ? null : top3Rank,
        "top_3_score": top3Score == null ? null : top3Score,
        "top_3_user_id": top3UserId == null ? null : top3UserId,
        "top_3_gender": top3Gender,
        "top_3_username": top3Username == null ? null : top3Username,
    };
}
