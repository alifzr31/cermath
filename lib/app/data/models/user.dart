// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.usersId,
    required this.usertypeId,
    required this.classId,
    required this.genderId,
    required this.username,
    required this.email,
    required this.password,
    required this.fullname,
    required this.phone,
    required this.token,
  });

  String usersId;
  int usertypeId;
  int classId;
  int genderId;
  String username;
  String email;
  String password;
  String fullname;
  dynamic phone;
  String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        usersId: json["users_id"],
        usertypeId: json["usertype_id"],
        classId: json["class_id"],
        genderId: json["gender_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        fullname: json["fullname"],
        phone: json["phone"],
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "users_id": usersId,
        "usertype_id": usertypeId,
        "class_id": classId,
        "gender_id": genderId,
        "username": username,
        "email": email,
        "password": password,
        "fullname": fullname,
        "phone": phone,
        "token": token,
      };
}
