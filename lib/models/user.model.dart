// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());


class User {
    User({
        required this.userType,
        required this.id,
        required this.name,
        required this.phoneNumber,
        required this.email,
        required this.balance,
        required this.password,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    final String userType;
    final String id;
    final String name;
    final String phoneNumber;
    final String email;
    final int balance;
    final String password;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        userType: json["user_type"],
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        balance: json["balance"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "user_type": userType,
        "_id": id,
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
        "balance": balance,
        "password": password,
    };
}
