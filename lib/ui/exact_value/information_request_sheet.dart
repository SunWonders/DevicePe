import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsRequestAgreement extends StatefulWidget {
  DetailsRequestAgreement({Key? key}) : super(key: key);

  @override
  _DetailsRequestAgreementState createState() =>
      _DetailsRequestAgreementState();
}

class _DetailsRequestAgreementState extends State<DetailsRequestAgreement> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0), bottom: Radius.zero),
      child: Container(
        padding: EdgeInsets.all(15.0),
        height: 400,
        color: AppColors.whiteText,
        child: Column(
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/images/check_list.png'),
              ),
            ),
            Text(
              "Help us calculate the value of your device accurately by answering the following questions.",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                width: 100,
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
          ],
        ),
      ),
    );
  }
}
