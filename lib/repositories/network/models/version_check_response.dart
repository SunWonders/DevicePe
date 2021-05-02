// To parse this JSON data, do
//
//     final versionCheckResponse = versionCheckResponseFromJson(jsonString);

import 'dart:convert';

VersionCheckResponse versionCheckResponseFromJson(String str) =>
    VersionCheckResponse.fromJson(json.decode(str));

String versionCheckResponseToJson(VersionCheckResponse data) =>
    json.encode(data.toJson());

class VersionCheckResponse {
  VersionCheckResponse({
    this.statusCode,
    this.statusMessage,
    this.isActive,
  });

  int statusCode;
  String statusMessage;
  bool isActive;

  factory VersionCheckResponse.fromJson(Map<String, dynamic> json) =>
      VersionCheckResponse(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
        "isActive": isActive,
      };
}
