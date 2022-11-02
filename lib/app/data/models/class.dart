// To parse this JSON data, do
//
//     final class = classFromJson(jsonString);

import 'dart:convert';

List<Class> classFromJson(String str) =>
    List<Class>.from(json.decode(str).map((x) => Class.fromJson(x)));

String classToJson(List<Class> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Class {
  Class({
    required this.classId,
    required this.className,
  });

  int classId;
  String className;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        classId: json["classId"],
        className: json["className"],
      );

  Map<String, dynamic> toJson() => {
        "classId": classId,
        "className": className,
      };
}
