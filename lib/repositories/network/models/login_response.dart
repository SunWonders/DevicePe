// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    // this.timestamp,
    // this.status,
    // this.error,
    // this.message,
    // this.path,
    this.userId,
    this.firstName,
    this.lastName,
    this.middleName,
    this.jwtToken,
  });

  //DateTime timestamp;
  //int status;
  int userId;
  String firstName;
  String lastName;
  String middleName;
  String jwtToken;
  //String error;
  //String message;
  //String path;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        //timestamp: DateTime.parse(json["timestamp"]),
        //status: json["status"],
        //error: json["error"],
        //message: json["message"],
        //path: json["path"],
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
        jwtToken: json["jwtToken"],
      );

  Map<String, dynamic> toJson() => {
        // "timestamp": timestamp.toIso8601String(),
        // "status": status,
        // "error": error,
        // "message": message,
        // "path": path,
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "jwtToken": jwtToken,
      };
}
