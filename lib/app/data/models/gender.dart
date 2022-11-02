// To parse this JSON data, do
//
//     final gender = genderFromJson(jsonString);

import 'dart:convert';

List<Gender> genderFromJson(String str) =>
    List<Gender>.from(json.decode(str).map((x) => Gender.fromJson(x)));

String genderToJson(List<Gender> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gender {
  Gender({
    required this.genderId,
    required this.genderName,
  });

  int genderId;
  String genderName;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        genderId: json["genderId"],
        genderName: json["genderName"],
      );

  Map<String, dynamic> toJson() => {
        "genderId": genderId,
        "genderName": genderName,
      };
}
