import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Aggreement extends StatefulWidget {
  Aggreement({Key? key}) : super(key: key);

  @override
  _AggreementState createState() => _AggreementState();
}

class _AggreementState extends State<Aggreement> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0), bottom: Radius.zero),
      child: Container(
        padding: EdgeInsets.all(15.0),
        height: 430,
        color: AppColors.whiteText,
        child: Column(
          children: [
            SizedBox(
              height: 15.0,
            ),
            Text(
              "By Clicking on proceed you agree that your device meets our minimum buying criteria.",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              //color: AppColors.dark), //.withOpacity(0.9)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(children: [
              Icon(Icons.task_alt, color: AppColors.secondary),
              SizedBox(
                width: 10.0,
              ),
              Text("You are a legal Owner Of the Device"),
            ]),
            SizedBox(
              height: 15.0,
            ),
            Row(children: [
              Icon(Icons.task_alt, color: AppColors.secondary),
              SizedBox(
                width: 10.0,
              ),
              Text("Your Device turns on successfully"),
            ]),
            SizedBox(
              height: 15.0,
            ),
            Row(children: [
              Icon(Icons.task_alt, color: AppColors.secondary),
              SizedBox(
                width: 10.0,
              ),
              Text("You are able to make or receive calls"),
            ]),
            SizedBox(
              height: 15.0,
            ),
            Row(children: [
              Icon(Icons.task_alt, color: AppColors.secondary),
              SizedBox(
                width: 10.0,
              ),
              Text("IMEI/TAC is authentic"),
            ]),
            SizedBox(
              height: 15.0,
            ),
            Row(children: [
              Icon(Icons.task_alt, color: AppColors.secondary),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Text(
                  "Doesn't have any brand/iCloud/Password lock (We Recommend a factory reset before selling )",
                  style: TextStyle(
                    height: 1.2,
                    wordSpacing: 1.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Container(
                      margin: EdgeInsets.all(2),
                      width: 100,
                      color: AppColors.primaryLight,
                      child: TextButton(
                        onPressed: () => {
                          Get.back(),
                          Get.back(),
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: AppColors.whiteText),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Container(
                      width: 100,
                      margin: EdgeInsets.all(2),
                      color: AppColors.primaryLight,
                      child: TextButton(
                        onPressed: () => {
                          Get.back(),
                        },
                        child: Text(
                          "Proceed",
                          style: TextStyle(color: AppColors.whiteText),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
