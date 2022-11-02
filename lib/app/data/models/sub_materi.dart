// To parse this JSON data, do
//
//     final subMateri = subMateriFromJson(jsonString);

import 'dart:convert';

List<SubMateri> subMateriFromJson(String str) =>
    List<SubMateri>.from(json.decode(str).map((x) => SubMateri.fromJson(x)));

String subMateriToJson(List<SubMateri> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubMateri {
  SubMateri({
    required this.timestamp,
    required this.sublessonId,
    required this.sublessonName,
    required this.sublessonDescription,
    required this.lessonId,
    required this.sublessonImage,
  });

  DateTime timestamp;
  String sublessonId;
  String sublessonName;
  String sublessonDescription;
  String lessonId;
  String sublessonImage;

  factory SubMateri.fromJson(Map<String, dynamic> json) => SubMateri(
        timestamp: DateTime.parse(json["timestamp"]),
        sublessonId: json["sublessonId"],
        sublessonName: json["sublessonName"],
        sublessonDescription: json["sublessonDescription"],
        lessonId: json["lessonId"],
        sublessonImage: json["sublessonImage"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "sublessonId": sublessonId,
        "sublessonName": sublessonName,
        "sublessonDescription": sublessonDescription,
        "lessonId": lessonId,
        "sublessonImage": sublessonImage,
      };
}
