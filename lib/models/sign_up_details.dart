


// To parse this JSON data, do
//
//     final userSignUpResponse = userSignUpResponseFromJson(jsonString);

import 'dart:convert';

UserSignUpResponse userSignUpResponseFromJson(String str) => UserSignUpResponse.fromJson(json.decode(str));

String userSignUpResponseToJson(UserSignUpResponse data) => json.encode(data.toJson());

class UserSignUpResponse {
    String? message;
    String? email;
    String? username;

    UserSignUpResponse({
        this.message,
        this.email,
        this.username,
    });

    factory UserSignUpResponse.fromJson(Map<String, dynamic> json) => UserSignUpResponse(
        message: json["message"],
        email: json["Email"],
        username: json["Username"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "Email": email,
        "Username": username,
    };
}
