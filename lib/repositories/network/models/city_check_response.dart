// To parse this JSON data, do
//
//     final cityCheckResponse = cityCheckResponseFromJson(jsonString);

import 'dart:convert';

CityCheckResponse cityCheckResponseFromJson(String str) =>
    CityCheckResponse.fromJson(json.decode(str));

String cityCheckResponseToJson(CityCheckResponse data) =>
    json.encode(data.toJson());

class CityCheckResponse {
  CityCheckResponse({
    this.status,
    this.message,
    this.isActive,
    this.data,
  });

  int status;
  String message;
  bool isActive;
  dynamic data;

  factory CityCheckResponse.fromJson(Map<String, dynamic> json) =>
      CityCheckResponse(
        status: json["status"],
        message: json["message"],
        isActive: json["isActive"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isActive": isActive,
        "data": data,
      };
}
