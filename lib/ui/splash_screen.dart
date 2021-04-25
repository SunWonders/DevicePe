import 'dart:async';

import 'package:flutter/material.dart';
import 'package:devicepe_client/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // Timer(
    //   Duration(seconds: 3),
    //   () => launchScreen(context, home),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DevicePe"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Launch Application"),
            FloatingActionButton(
              child: Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              onPressed: () {
                launchScreen(context, getStarted);
              },
            ),
          ],
        ),
      ),
    );
  }
}
