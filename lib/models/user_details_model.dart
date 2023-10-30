// To parse this JSON data, do
//
//     final userDataDetails = userDataDetailsFromJson(jsonString);

import 'dart:convert';

UserDataDetails userDataDetailsFromJson(String str) => UserDataDetails.fromJson(json.decode(str));

String userDataDetailsToJson(UserDataDetails data) => json.encode(data.toJson());

class UserDataDetails {
    String? message;
    int? userId;
    String? username;
    String? email;
    String? address;
    dynamic dateOfBirth;
    dynamic phoneNumber;

    UserDataDetails({
        this.message,
        this.userId,
        this.username,
        this.email,
        this.address,
        this.dateOfBirth,
        this.phoneNumber,
    });

    factory UserDataDetails.fromJson(Map<String, dynamic> json) => UserDataDetails(
        message: json["message"],
        userId: json["user_id"],
        username: json["username"],
        email: json["email"],
        address: json["address"],
        dateOfBirth: json["date_of_birth"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user_id": userId,
        "username": username,
        "email": email,
        "address": address,
        "date_of_birth": dateOfBirth,
        "phone_number": phoneNumber,
    };
}
