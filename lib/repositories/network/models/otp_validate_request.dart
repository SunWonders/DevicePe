// To parse this JSON data, do
//
//     final otpValidateRequest = otpValidateRequestFromJson(jsonString);

import 'dart:convert';

OtpValidateRequest otpValidateRequestFromJson(String str) =>
    OtpValidateRequest.fromJson(json.decode(str));

String otpValidateRequestToJson(OtpValidateRequest data) =>
    json.encode(data.toJson());

class OtpValidateRequest {
  OtpValidateRequest({
    this.mobileNumber,
    this.otp,
  });

  String mobileNumber;
  String otp;

  factory OtpValidateRequest.fromJson(Map<String, dynamic> json) =>
      OtpValidateRequest(
        mobileNumber: json["mobileNumber"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "otp": otp,
      };
}
