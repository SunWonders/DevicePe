import 'package:devicepe_client/ui/home/home_accessories.dart';
import 'package:devicepe_client/ui/home/home_screen_banner.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/cupertino.dart';
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
          color: AppColors.whiteText,
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HomeScreenBanner(),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 20, 0.0, 20.0),
                alignment: Alignment.center,
                child: Text(
                  "What Would You Like To Sell with Us?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.primaryLight),
                  textAlign: TextAlign.center,
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
