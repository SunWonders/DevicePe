import 'package:devicepe_client/ui/home/home_accessories.dart';
import 'package:devicepe_client/ui/home/home_screen_banner.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              HomeScreenBanner(),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 30, 0.0, 5.0),
                child: Text(
                  "What Would You Like To Sell with Us?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 500,
                child: HomeAccessory(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
