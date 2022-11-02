// To parse this JSON data, do
//
//     final materi = materiFromJson(jsonString);

import 'dart:convert';

List<Materi> materiFromJson(String str) =>
    List<Materi>.from(json.decode(str).map((x) => Materi.fromJson(x)));

String materiToJson(List<Materi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Materi {
  Materi({
    required this.timestamp,
    required this.lessonId,
    required this.classId,
    required this.lessonName,
    required this.lessonDescription,
    required this.lessonImage,
    required this.className,
  });

  DateTime timestamp;
  String lessonId;
  int classId;
  String lessonName;
  String lessonDescription;
  String lessonImage;
  String className;

  factory Materi.fromJson(Map<String, dynamic> json) => Materi(
        timestamp: DateTime.parse(json["timestamp"]),
        lessonId: json["lessonId"],
        classId: json["classId"],
        lessonName: json["lessonName"],
        lessonDescription: json["lessonDescription"],
        lessonImage: json["lessonImage"],
        className: json["className"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "lessonId": lessonId,
        "classId": classId,
        "lessonName": lessonName,
        "lessonDescription": lessonDescription,
        "lessonImage": lessonImage,
        "className": className,
      };
}
