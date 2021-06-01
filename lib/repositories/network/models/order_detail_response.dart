// To parse this JSON data, do
//
//     final orderDetailResponse = orderDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

OrderDetailResponse orderDetailResponseFromJson(String str) =>
    OrderDetailResponse.fromJson(json.decode(str));

String orderDetailResponseToJson(OrderDetailResponse data) =>
    json.encode(data.toJson());

class OrderDetailResponse {
  OrderDetailResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  RxList<OrderDetailData>? data;

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      OrderDetailResponse(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : RxList<OrderDetailData>.from(
                json["data"].map((x) => OrderDetailData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OrderDetailData {
  OrderDetailData({
    this.description,
    this.price,
    this.orderId,
    this.orderCreatedDate,
    this.status,
    this.pickUpTime,
  });

  String? description;
  double? price;
  String? orderId;
  int? orderCreatedDate;
  String? status;
  int? pickUpTime;

  factory OrderDetailData.fromJson(Map<String, dynamic> json) =>
      OrderDetailData(
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        orderId: json["orderId"] == null ? null : json["orderId"],
        orderCreatedDate:
            json["orderCreatedDate"] == null ? null : json["orderCreatedDate"],
        status: json["status"] == null ? null : json["status"],
        pickUpTime: json["pickUpTime"] == null ? null : json["pickUpTime"],
      );

  Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "orderId": orderId == null ? null : orderId,
        "orderCreatedDate": orderCreatedDate == null ? null : orderCreatedDate,
        "status": status == null ? null : status,
        "pickUpTime": pickUpTime == null ? null : pickUpTime,
      };
}
