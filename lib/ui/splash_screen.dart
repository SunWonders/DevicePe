import 'package:devicepe_client/repositories/network/controllers/authentication_controller.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var controller = Get.put(AuthenticationController());
  void initState() {
    super.initState();
    controller.versionCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/sale-flyer.gif",
            ),
            Text("Please Wait.."),
          ],
        ),
      ),
    );
  }
}
