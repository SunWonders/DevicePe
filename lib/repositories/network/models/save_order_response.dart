// To parse this JSON data, do
//
//     final saveOrderResponse = saveOrderResponseFromJson(jsonString);

import 'dart:convert';

SaveOrderResponse saveOrderResponseFromJson(String str) =>
    SaveOrderResponse.fromJson(json.decode(str));

String saveOrderResponseToJson(SaveOrderResponse data) =>
    json.encode(data.toJson());

class SaveOrderResponse {
  SaveOrderResponse({
    this.status = 0,
    this.message = "",
    this.data = "",
  });

  int status;
  String message;
  String data;

  factory SaveOrderResponse.fromJson(Map<String, dynamic> json) =>
      SaveOrderResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };

  bool checkStatus() {
    return status == 200 && message == "Success";
  }
}
