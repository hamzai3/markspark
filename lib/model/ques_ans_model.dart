// To parse this JSON data, do
//
//     final quesAnsModel = quesAnsModelFromJson(jsonString);

import 'dart:convert';

QuesAnsModel quesAnsModelFromJson(String str) => QuesAnsModel.fromJson(json.decode(str));

String quesAnsModelToJson(QuesAnsModel data) => json.encode(data.toJson());

class QuesAnsModel {
    QuesAnsModel({
        this.response,
    });

    List<Response> response;

    factory QuesAnsModel.fromJson(Map<String, dynamic> json) => QuesAnsModel(
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
        this.subjectId,
        this.questionList,
        this.addedOn,
    });

    String status;
    String reason;
    String subjectId;
    List<QuestionList> questionList;
    List<String> addedOn;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        status: json["status"] == null ? null : json["status"],
        reason: json["reason"] == null ? null : json["reason"],
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        questionList: json["question_list"] == null ? null : List<QuestionList>.from(json["question_list"].map((x) => QuestionList.fromJson(x))),
        addedOn: json["added_on"] == null ? null : List<String>.from(json["added_on"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "reason": reason == null ? null : reason,
        "subject_id": subjectId == null ? null : subjectId,
        "question_list": questionList == null ? null : List<dynamic>.from(questionList.map((x) => x.toJson())),
        "added_on": addedOn == null ? null : List<dynamic>.from(addedOn.map((x) => x)),
    };
}

class QuestionList {
    QuestionList({
        this.questionId,
        this.question,
        this.subjectName,
        this.answerList,
    });

    String questionId;
    String question;
    String subjectName;
    List<AnswerList> answerList;

    factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
        questionId: json["question_id"] == null ? null : json["question_id"],
        question: json["question"] == null ? null : json["question"],
        subjectName: json["subject_name"] == null ? null : json["subject_name"],
        answerList: json["answer_list"] == null ? null : List<AnswerList>.from(json["answer_list"].map((x) => AnswerList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "question_id": questionId == null ? null : questionId,
        "question": question == null ? null : question,
        "subject_name": subjectName == null ? null : subjectName,
        "answer_list": answerList == null ? null : List<dynamic>.from(answerList.map((x) => x.toJson())),
    };
}

class AnswerList {
    AnswerList({
        this.isRight,
        this.choice,
        this.choiceId,
        this.isCorrect,
    });

    String isRight;
    String choice;
    String choiceId;
    bool isCorrect;

    factory AnswerList.fromJson(Map<String, dynamic> json) => AnswerList(
        isRight: json["is_right"] == null ? null : json["is_right"],
        choice: json["choice"] == null ? null : json["choice"],
        choiceId: json["choice_id"] == null ? null : json["choice_id"],
        isCorrect: json["is_correct"] == null ? null : json["is_correct"],
    );

    Map<String, dynamic> toJson() => {
        "is_right": isRight == null ? null : isRight,
        "choice": choice == null ? null : choice,
        "choice_id": choiceId == null ? null : choiceId,
        "is_correct": isCorrect == null ? null : isCorrect,
    };
}
