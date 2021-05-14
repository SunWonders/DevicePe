// To parse this JSON data, do
//
//     final brandDetailResponse = brandDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/get_rx.dart';

BrandDetailResponse? brandDetailResponseFromJson(String? str) =>
    str != null ? BrandDetailResponse.fromJson(json.decode(str)) : null;

String brandDetailResponseToJson(BrandDetailResponse data) =>
    json.encode(data.toJson());

class BrandDetailResponse {
  BrandDetailResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  RxList<BrandData>? data;

  factory BrandDetailResponse.fromJson(Map<String, dynamic> json) =>
      BrandDetailResponse(
        status: json["status"],
        message: json["message"],
        data: RxList<BrandData>.from(
            json["data"].map((x) => BrandData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : [],
      };
}

class BrandData {
  BrandData({
    this.id,
    this.brandName,
    this.isActive,
    this.brandIconUrl,
  });

  int? id;
  String? brandName;
  int? isActive;
  String? brandIconUrl;

  factory BrandData.fromJson(Map<String, dynamic> json) => BrandData(
        id: json["id"],
        brandName: json["brandName"],
        isActive: json["isActive"],
        brandIconUrl: json["brandIconUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brandName": brandName,
        "isActive": isActive,
        "brandIconUrl": brandIconUrl,
      };
}
