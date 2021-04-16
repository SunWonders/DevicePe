// To parse this JSON data, do
//
//     final checkListDetailResponse = checkListDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

CheckListDetailResponse checkListDetailResponseFromJson(String str) =>
    CheckListDetailResponse.fromJson(json.decode(str));

String checkListDetailResponseToJson(CheckListDetailResponse data) =>
    json.encode(data.toJson());

class CheckListDetailResponse {
  CheckListDetailResponse({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  RxList<CheckListData> data;

  factory CheckListDetailResponse.fromJson(Map<String, dynamic> json) =>
      CheckListDetailResponse(
        status: json["status"],
        message: json["message"],
        data: RxList<CheckListData>.from(
            json["data"].map((x) => CheckListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CheckListData {
  CheckListData({
    this.isActive,
    this.price,
    this.description,
    this.varientId,
    this.type,
    this.isMandatory,
    this.iconUrl,
    this.id,
  });

  int isActive;
  double price;
  String description;
  dynamic varientId;
  String type;
  int isMandatory;
  String iconUrl;
  int id;

  factory CheckListData.fromJson(Map<String, dynamic> json) => CheckListData(
        isActive: json["isActive"],
        price: json["price"],
        description: json["description"],
        varientId: json["varientId"],
        type: json["type"],
        isMandatory: json["isMandatory"],
        iconUrl: json["iconUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "isActive": isActive,
        "price": price,
        "description": description,
        "varientId": varientId,
        "type": type,
        "isMandatory": isMandatory,
        "iconUrl": iconUrl,
        "id": id,
      };
}
