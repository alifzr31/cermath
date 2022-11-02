// To parse this JSON data, do
//
//     final quizList = quizListFromJson(jsonString);

import 'dart:convert';

List<QuizList> quizListFromJson(String str) =>
    List<QuizList>.from(json.decode(str).map((x) => QuizList.fromJson(x)));

String quizListToJson(List<QuizList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizList {
  QuizList({
    required this.difficulity,
    required this.timestamp,
    required this.quizId,
    required this.lessonId,
    required this.maxScore,
    required this.quizName,
  });

  int difficulity;
  DateTime timestamp;
  String quizId;
  String lessonId;
  int maxScore;
  String quizName;

  factory QuizList.fromJson(Map<String, dynamic> json) => QuizList(
        difficulity: json["difficulity"],
        timestamp: DateTime.parse(json["timestamp"]),
        quizId: json["quizId"],
        lessonId: json["lessonId"],
        maxScore: json["maxScore"],
        quizName: json["quizName"],
      );

  Map<String, dynamic> toJson() => {
        "difficulity": difficulity,
        "timestamp": timestamp.toIso8601String(),
        "quizId": quizId,
        "lessonId": lessonId,
        "maxScore": maxScore,
        "quizName": quizName,
      };
}
