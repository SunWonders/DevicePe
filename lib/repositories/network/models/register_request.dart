// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    this.phoneNumber = "",
    this.password = "",
    this.firstName = "",
    this.lastName = "",
    this.middleName = "",
  });

  String phoneNumber;
  String password;
  final String typeOfUser = "CUSTOMER";
  final String application = "DevicePe";
  String firstName = "";
  String lastName = "";
  String middleName = "";

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
        "typeOfUser": typeOfUser,
        "application": application,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
      };
}
