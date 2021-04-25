// To parse this JSON data, do
//
//     final otpValidateResponse = otpValidateResponseFromJson(jsonString);

import 'dart:convert';

OtpValidateResponse otpValidateResponseFromJson(String str) =>
    OtpValidateResponse.fromJson(json.decode(str));

String otpValidateResponseToJson(OtpValidateResponse data) =>
    json.encode(data.toJson());

class OtpValidateResponse {
  OtpValidateResponse({
    this.status,
    this.message,
  });

  int status;
  String message;

  factory OtpValidateResponse.fromJson(Map<String, dynamic> json) =>
      OtpValidateResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
