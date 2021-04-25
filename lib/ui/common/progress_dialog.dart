import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoaderDialog() {
  AlertDialog alert = AlertDialog(
    content: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(width: 20),
        Container(
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 7),
            child: Text("Loading...")),
      ],
    ),
  );
  Get.dialog(alert, barrierDismissible: false);
}
