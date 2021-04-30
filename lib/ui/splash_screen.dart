import 'dart:async';

import 'package:devicepe_client/utils/colors.dart';
import 'package:devicepe_client/utils/sahred_pref.dart';
import 'package:flutter/material.dart';
import 'package:devicepe_client/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    checkLogin();
  }

  checkLogin() async {
    var token = await SharedPref().readString(SharedPref.JWT_TOKEN);
    if (token == null || token.isEmpty) {
      Timer(
        Duration(seconds: 3),
        () => launchScreen(context, getStarted),
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () => launchScreen(context, home),
      );
    }
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
