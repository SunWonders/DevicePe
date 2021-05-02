// To parse this JSON data, do
//
//     final saveOrderRequest = saveOrderRequestFromJson(jsonString);

import 'dart:convert';

SaveOrderRequest saveOrderRequestFromJson(String str) =>
    SaveOrderRequest.fromJson(json.decode(str));

String saveOrderRequestToJson(SaveOrderRequest data) =>
    json.encode(data.toJson());

class SaveOrderRequest {
  SaveOrderRequest({
    this.description,
    this.price,
    this.userId,
    this.varientId,
    this.checkListData,
    this.fullname,
    this.mobileNumber,
    this.address,
    this.pincode,
    this.state,
    this.city,
    this.emailId,
    this.latitude,
    this.longitude,
    this.pickuptime,
  });

  String description;
  double price;
  int userId;
  int varientId;
  List<CheckListDatum> checkListData;
  String fullname;
  String mobileNumber;
  String address;
  String pincode;
  String state;
  String city;
  String emailId;
  double latitude;
  double longitude;
  int pickuptime;

  factory SaveOrderRequest.fromJson(Map<String, dynamic> json) =>
      SaveOrderRequest(
        description: json["description"],
        price: json["price"].toDouble(),
        userId: json["userId"],
        varientId: json["varientId"],
        checkListData: List<CheckListDatum>.from(
            json["checkListData"].map((x) => CheckListDatum.fromJson(x))),
        fullname: json["fullname"],
        mobileNumber: json["mobileNumber"],
        address: json["address"],
        pincode: json["pincode"],
        state: json["state"],
        city: json["city"],
        emailId: json["emailId"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        pickuptime: json["pickuptime"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "price": price,
        "userId": userId,
        "varientId": varientId,
        "checkListData":
            List<dynamic>.from(checkListData.map((x) => x.toJson())),
        "fullname": fullname,
        "mobileNumber": mobileNumber,
        "address": address,
        "pincode": pincode,
        "state": state,
        "city": city,
        "emailId": emailId,
        "latitude": latitude,
        "longitude": longitude,
        "pickuptime": pickuptime,
      };
}

class CheckListDatum {
  CheckListDatum({
    this.userSelectedValue,
    this.checkListId,
  });

  List<int> userSelectedValue;
  int checkListId;

  factory CheckListDatum.fromJson(Map<String, dynamic> json) => CheckListDatum(
        userSelectedValue:
            List<int>.from(json["userSelectedValue"].map((x) => x)),
        checkListId: json["checkListId"],
      );

  Map<String, dynamic> toJson() => {
        "userSelectedValue":
            List<dynamic>.from(userSelectedValue.map((x) => x)),
        "checkListId": checkListId,
      };
}
