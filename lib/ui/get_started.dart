import 'package:devicepe_client/ui/common/login_register_popup.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:devicepe_client/routes/routes.dart';
import 'package:devicepe_client/styles/text_styles.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
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
                Image(
                  height: 300,
                  image: AssetImage('assets/images/sell_mobile.png'),
                ),
                SizedBox(height: 50),
                Text(
                  "Feel Free to",
                  style: commonTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  "Sell Your Mobile",
                  style: commonTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  "With Us.",
                  style: commonTextStyle,
                ),
                SizedBox(height: 40),
                FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      liquidController.jumpToPage(page: 1);
                    },
                    child: Icon(Icons.forward),
                    backgroundColor: Colors.transparent),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  child: Image(
                    height: 20,
                    color: AppColors.whiteText,
                    image: AssetImage('assets/images/swipe_right.png'),
                  ),
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
                Image(
                  height: 300,
                  image: AssetImage('assets/images/best_price.png'),
                ),
                SizedBox(height: 50),
                Text(
                  "Best & Highest",
                  style: commonTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  " Value for Your",
                  style: commonTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  "Device",
                  style: commonTextStyle,
                ),
                SizedBox(height: 40),
                FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      liquidController.jumpToPage(page: 2);
                      //Get.to(() => LoginPage());
                    },
                    child: Icon(Icons.forward),
                    backgroundColor: Colors.transparent),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  child: Image(
                    height: 20,
                    color: AppColors.whiteText,
                    image: AssetImage('assets/images/swipe_right.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        color: Colors.green,
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
                Image(
                  height: 300,
                  image: AssetImage('assets/images/lovely_service.png'),
                ),
                SizedBox(height: 50),
                Text(
                  "Lakhs Of People",
                  style: commonTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  "Loved Our Valuable",
                  style: commonTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  "Service",
                  style: commonTextStyle,
                ),
                SizedBox(height: 40),
                FloatingActionButton(
                    onPressed: () {
                      // redirectToHome = true;
                      // launchScreen(context, home);
                      Get.bottomSheet(AuthenticationRequest());
                    },
                    child: Icon(Icons.home),
                    backgroundColor: Colors.transparent),
                Image(
                  height: 100,
                  image: AssetImage('assets/images/stay-home.png'),
                )
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
