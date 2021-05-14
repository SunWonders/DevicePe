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

  // int status;
  // String? message;
  // RxList<VariantData>? data;
  // double? bestBasePrice;

  int? status;
  String? message;
  RxList<VariantData>? data;
  double? bestBasePrice = 0.0;

  factory VarientDetailResponse.fromJson(Map<String, dynamic> json) =>
      VarientDetailResponse(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : RxList<VariantData>.from(
                json["data"].map((x) => VariantData.fromJson(x))),
        bestBasePrice:
            json["bestBasePrice"] == null ? null : json["bestBasePrice"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "bestBasePrice": bestBasePrice == null ? null : bestBasePrice,
      };

  // factory VarientDetailResponse.fromJson(Map<String, dynamic> json) =>
  //     VarientDetailResponse(
  //       status: json["status"],
  //       message: json["message"],
  //       data: RxList<VariantData>.from(
  //           json["data"].map((x) => VariantData.fromJson(x))),
  //       bestBasePrice: json["bestBasePrice"].toDouble(),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": data != null
  //           ? RxList<dynamic>.from(data!.map((x) => x.toJson()))
  //           : [].obs,
  //       "bestBasePrice": bestBasePrice,
  //     };
}

class VariantData {
  VariantData(
      {this.id,
      this.varientName,
      this.varientIconUrl,
      this.isActive,
      this.basePrice,
      this.capacity,
      this.color,
      this.description,
      this.specifications,
      this.boxPrice,
      this.headPhonePrice,
      this.chargerPrice,
      this.billPrice,
      this.likeNew,
      this.good,
      this.average,
      this.belowAverage});

  int? id;
  String? varientName;
  List<String>? varientIconUrl;
  int? isActive;
  double? basePrice;
  String? capacity;
  String? color;
  String? description;
  RxList<Specification>? specifications;

  double? boxPrice;
  double? headPhonePrice;
  double? chargerPrice;
  double? billPrice;
  double? likeNew;
  double? good;
  double? average;
  double? belowAverage;

  factory VariantData.fromJson(Map<String, dynamic> json) => VariantData(
        id: json["id"] == null ? null : json["id"],
        varientName: json["varientName"] == null ? null : json["varientName"],
        varientIconUrl: json["varientIconUrl"] != null
            ? List<String>.from(json["varientIconUrl"])
            : [],
        isActive: json["isActive"] == null ? null : json["isActive"],
        basePrice: json["basePrice"] == null ? null : json["basePrice"],
        capacity: json["capacity"] == null ? null : json["capacity"],
        color: json["color"],
        description: json["description"],
        specifications: json["specifications"] == null
            ? <Specification>[].obs
            : RxList<Specification>.from(
                json["specifications"].map((x) => Specification.fromJson(x))),
        boxPrice: json["boxPrice"] == null ? null : json["boxPrice"],
        headPhonePrice:
            json["headPhonePrice"] == null ? null : json["headPhonePrice"],
        chargerPrice:
            json["chargerPrice"] == null ? null : json["chargerPrice"],
        billPrice: json["billPrice"] == null ? null : json["billPrice"],
        likeNew: json["likeNew"] == null ? null : json["likeNew"],
        good: json["good"] == null ? null : json["good"],
        average: json["average"] == null ? null : json["average"],
        belowAverage:
            json["belowAverage"] == null ? null : json["belowAverage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "varientName": varientName,
        "varientIconUrl": varientIconUrl != null
            ? List<dynamic>.from(varientIconUrl!.map((x) => x))
            : [],
        "isActive": isActive,
        "basePrice": basePrice,
        "boxPrice": boxPrice,
        "headPhonePrice": headPhonePrice,
        "chargerPrice": chargerPrice,
        "billPrice": billPrice,
        "likeNew": likeNew,
        "good": good,
        "average": average,
        "belowAverage": belowAverage,
        "capacity": capacity,
        "color": color,
        "description": description,
        "specifications": specifications != null
            ? List<dynamic>.from(specifications!.map((x) => x.toJson()))
            : [],
      };
}

class Specification {
  Specification({
    required this.key,
    required this.value,
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
