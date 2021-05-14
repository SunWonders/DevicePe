import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class ServiceUnAvailable extends StatefulWidget {
  ServiceUnAvailable({Key? key}) : super(key: key);

  @override
  _ServiceUnAvailableState createState() => _ServiceUnAvailableState();
}

class _ServiceUnAvailableState extends State<ServiceUnAvailable> {
  _ServiceUnAvailableState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Sorry",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors.primaryLight,
                ),
              ),
            ),

            Image(
              image: AssetImage('assets/images/im_sorry.png'),
            ),
            // Image.asset(
            //   "assets/images/order_booked_success.gif",
            // ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Service Unavailable.",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.primaryDark,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Please Check App Updates or Contact Administrator.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.primaryLight,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
