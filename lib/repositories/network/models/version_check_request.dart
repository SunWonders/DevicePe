// To parse this JSON data, do
//
//     final versionCheckRequest = versionCheckRequestFromJson(jsonString);

import 'dart:convert';

VersionCheckRequest versionCheckRequestFromJson(String str) =>
    VersionCheckRequest.fromJson(json.decode(str));

String versionCheckRequestToJson(VersionCheckRequest data) =>
    json.encode(data.toJson());

class VersionCheckRequest {
  VersionCheckRequest({
    this.version,
    this.typeOfApp,
    this.application,
  });

  String version;
  String typeOfApp;
  String application;

  factory VersionCheckRequest.fromJson(Map<String, dynamic> json) =>
      VersionCheckRequest(
        version: json["version"],
        typeOfApp: json["typeOfApp"],
        application: json["application"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "typeOfApp": typeOfApp,
        "application": application,
      };
}
