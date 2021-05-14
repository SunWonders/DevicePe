import 'dart:convert';

import 'package:get/get.dart';

AccessoriesDetailResponse accessoriesDetailResponseFromJson(String str) =>
    AccessoriesDetailResponse.fromJson(json.decode(str));

String accessoriesDetailResponseToJson(AccessoriesDetailResponse data) =>
    json.encode(data.toJson());

class AccessoriesDetailResponse {
  AccessoriesDetailResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  RxList<AccessoriesDetailData>? data;

  factory AccessoriesDetailResponse.fromJson(Map<String, dynamic> json) =>
      AccessoriesDetailResponse(
        status: json["status"],
        message: json["message"],
        data: RxList<AccessoriesDetailData>.from(
            json["data"].map((x) => AccessoriesDetailData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : [],
      };
}

class AccessoriesDetailData {
  AccessoriesDetailData({
    this.type,
    this.isActive,
    this.id,
    this.imageUrl,
    this.name,
  });

  String? type;
  int? isActive;
  int? id;
  String? imageUrl;
  String? name;

  factory AccessoriesDetailData.fromJson(Map<String, dynamic> json) =>
      AccessoriesDetailData(
        type: json["type"],
        isActive: json["isActive"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "isActive": isActive,
        "id": id,
        "imageUrl": imageUrl,
        "name": name,
      };
}
