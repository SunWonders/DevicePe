// To parse this JSON data, do
//
//     final modelDetailResponse = modelDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/get_rx.dart';

ModelDetailResponse modelDetailResponseFromJson(String str) =>
    ModelDetailResponse.fromJson(json.decode(str));

String brandDetailResponseToJson(ModelDetailResponse data) =>
    json.encode(data.toJson());

class ModelDetailResponse {
  ModelDetailResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  RxList<ModelData>? data;

  factory ModelDetailResponse.fromJson(Map<String, dynamic> json) =>
      ModelDetailResponse(
        status: json["status"],
        message: json["message"],
        data: RxList<ModelData>.from(
            json["data"].map((x) => ModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ModelData {
  ModelData({
    this.id,
    this.modelName,
    this.isActive,
    this.modelIconUrl,
  });

  int? id;
  String? modelName;
  int? isActive;
  String? modelIconUrl;

  factory ModelData.fromJson(Map<String, dynamic> json) => ModelData(
        id: json["id"],
        modelName: json["modelName"],
        isActive: json["isActive"],
        modelIconUrl: json["modelIconUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "modelName": modelName,
        "isActive": isActive,
        "modelIconUrl": modelIconUrl,
      };
}
