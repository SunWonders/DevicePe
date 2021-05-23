import 'package:devicepe_client/ui/common/not_accepting_page.dart';
import 'package:devicepe_client/ui/exact_value/check_list.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobilePowerStatus extends StatefulWidget {
  MobilePowerStatus({Key? key}) : super(key: key);

  @override
  _MobilePowerStatusState createState() => _MobilePowerStatusState();
}

class _MobilePowerStatusState extends State<MobilePowerStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        backgroundColor: AppColors.whiteText,
        title: Text(
          "About Your Device",
          style: TextStyle(color: AppColors.primaryLight),
        ),
      ),
      body: Container(
        //padding: EdgeInsets.all(10.0),
        child: Stack(children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Does Your Mobile Switch on Successfully?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Note: Mobile must be able to make & Receive call \n (If applicable )",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "IMEI / TAC should be authentic.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Should not have Brand/ iCloud/ Password lock.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ), Image(
                image: AssetImage('assets/images/device_health.png'),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width - 1,
              color: AppColors.nutralLight,
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      width: Get.width / 2,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => NotAcceptingPage(
                              "Sorry, We are not accepting the device which is not switching on or touch not functioning."));
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                            color: AppColors.dark,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: AppColors.primaryLight,
                      height: 60,
                      width: Get.width / 2,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => PowerStateSelection());
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            color: AppColors.whiteText,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
