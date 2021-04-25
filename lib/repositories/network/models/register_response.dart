// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.status,
    this.message,
    this.savedId,
    this.otpInMinutes,
  });

  int status;
  String message;
  int savedId;
  int otpInMinutes;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        status: json["status"],
        message: json["message"],
        savedId: json["savedId"],
        otpInMinutes: json["otpInMinutes"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "savedId": savedId,
        "otpInMinutes": otpInMinutes,
      };

  bool checkStatus() {
    return status == 200 && message == "Success";
  }
}
