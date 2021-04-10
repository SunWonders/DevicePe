import 'package:flutter/material.dart';
import 'package:devicepe_client/routes/routes.dart';
import 'package:devicepe_client/styles/text_styles.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class Test {
  static bool redirectToHome = false;
}

class _GetStartedPageState extends State<GetStartedPage> {
  LiquidController liquidController;
  bool redirectToHome = false;

  @override
  void initState() {
    super.initState();
    liquidController = LiquidController();
  }

  List<Widget> _getPages(BuildContext context) {
    return [
      Container(
        color: Colors.pink,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Hi",
                  style: commonTextStyle,
                ),
                Text(
                  "It's Me",
                  style: commonTextStyle,
                ),
                Text(
                  "Yabaze",
                  style: commonTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        color: Colors.deepPurpleAccent,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Take a",
                  style: commonTextStyle,
                ),
                Text(
                  "look at",
                  style: commonTextStyle,
                ),
                Text(
                  "Liquid Swipe",
                  style: commonTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        color: Colors.greenAccent,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Liked?",
                ),
                Text(
                  "Fork!",
                  style: commonTextStyle,
                ),
                Text(
                  "Give Star!",
                  style: commonTextStyle,
                ),
                FloatingActionButton(onPressed: () {
                  redirectToHome = true;
                  launchScreen(context, home);
                })
              ],
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (redirectToHome) launchScreen(context, home);

    return Scaffold(
      body: new Container(
        child: LiquidSwipe(
          pages: _getPages(context),
          liquidController: liquidController,
          enableLoop: false,
        ),
      ),
    );
  }
}
