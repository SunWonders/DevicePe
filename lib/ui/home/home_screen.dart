import 'package:devicepe_client/ui/home/home_dashboard.dart';
import 'package:devicepe_client/ui/home/home_screen_banner.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key key}) : super(key: key);

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
              HomeDashBoard(),
            ],
          ),
        ),
      ),
    );
  }
}
