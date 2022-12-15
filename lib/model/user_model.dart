// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Users welcomeFromJson(String str) => Users.fromJson(json.decode(str));

class Users {
  Users({
    this.data,
  });

  List<User>? data;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
      );
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.profession,
  });

  int? id;
  String? name;
  String? email;
  String? profession;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profession: json["profession"],
      );
}
