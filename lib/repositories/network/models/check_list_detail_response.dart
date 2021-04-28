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

//SINGLE

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
    this.options,
    this.priceType,
  });

  int isActive;
  double price;
  String description;
  dynamic varientId;
  String type;
  int isMandatory;
  String iconUrl;
  int id;
  List<Option> options;
  String priceType;

  factory CheckListData.fromJson(Map<String, dynamic> json) => CheckListData(
        isActive: json["isActive"],
        price: json["price"],
        description: json["description"],
        varientId: json["varientId"],
        type: json["type"],
        isMandatory: json["isMandatory"],
        iconUrl: json["iconUrl"],
        id: json["id"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        priceType: json["priceType"] == null ? null : json["priceType"],
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
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "priceType": priceType == null ? null : priceType,
      };
}

class Option {
  Option({
    this.id,
    this.iconUrl,
    this.name,
    this.price,
  });

  int id;
  String iconUrl;
  String name;
  double price;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        iconUrl: json["iconUrl"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iconUrl": iconUrl,
        "name": name,
        "price": price,
      };
}
