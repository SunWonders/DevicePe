import 'dart:convert';

import 'package:get/get.dart';

VarientDetailResponse varientDetailResponseFromJson(String str) =>
    VarientDetailResponse.fromJson(json.decode(str));

String varientDetailResponseToJson(VarientDetailResponse data) =>
    json.encode(data.toJson());

class VarientDetailResponse {
  VarientDetailResponse({
    this.status,
    this.message,
    this.data,
    this.bestBasePrice,
  });

  int status;
  String message;
  RxList<VariantData> data;
  double bestBasePrice;

  factory VarientDetailResponse.fromJson(Map<String, dynamic> json) =>
      VarientDetailResponse(
        status: json["status"],
        message: json["message"],
        data: RxList<VariantData>.from(
            json["data"].map((x) => VariantData.fromJson(x))),
        bestBasePrice: json["bestBasePrice"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": RxList<dynamic>.from(data.map((x) => x.toJson())),
        "bestBasePrice": bestBasePrice,
      };
}

class VariantData {
  VariantData({
    this.id,
    this.varientName,
    this.varientIconUrl,
    this.isActive,
    this.basePrice,
    this.capacity,
    this.color,
    this.description,
    this.specifications,
  });

  int id;
  String varientName;
  RxList<String> varientIconUrl;
  int isActive;
  double basePrice;
  String capacity;
  String color;
  String description;
  RxList<Specification> specifications;

  factory VariantData.fromJson(Map<String, dynamic> json) => VariantData(
        id: json["id"],
        varientName: json["varientName"],
        varientIconUrl:
            RxList<String>.from(json["varientIconUrl"].map((x) => x)),
        isActive: json["isActive"],
        basePrice: json["basePrice"].toDouble(),
        capacity: json["capacity"],
        color: json["color"],
        description: json["description"],
        specifications: json["specifications"] == null
            ? null
            : RxList<Specification>.from(
                json["specifications"].map((x) => Specification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "varientName": varientName,
        "varientIconUrl": List<dynamic>.from(varientIconUrl.map((x) => x)),
        "isActive": isActive,
        "basePrice": basePrice,
        "capacity": capacity,
        "color": color,
        "description": description,
        "specifications": specifications == null
            ? null
            : List<dynamic>.from(specifications.map((x) => x.toJson())),
      };
}

class Specification {
  Specification({
    this.key,
    this.value,
  });

  String key;
  String value;

  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
