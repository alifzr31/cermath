// To parse this JSON data, do
//
//     final userType = userTypeFromJson(jsonString);

import 'dart:convert';

List<UserType> userTypeFromJson(String str) =>
    List<UserType>.from(json.decode(str).map((x) => UserType.fromJson(x)));

String userTypeToJson(List<UserType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserType {
  UserType({
    required this.usertypeId,
    required this.usertypeName,
  });

  int usertypeId;
  String usertypeName;

  factory UserType.fromJson(Map<String, dynamic> json) => UserType(
        usertypeId: json["usertypeId"],
        usertypeName: json["usertypeName"],
      );

  Map<String, dynamic> toJson() => {
        "usertypeId": usertypeId,
        "usertypeName": usertypeName,
      };
}
