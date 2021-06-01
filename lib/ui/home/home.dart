import 'package:devicepe_client/ui/home/home_screen.dart';
import 'package:devicepe_client/ui/orders/orders.dart';
import 'package:devicepe_client/ui/profile/user_profile.dart';
import 'package:devicepe_client/ui/select_city.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  _getPage() {
    switch (_currentIndex) {
      case 0:
        return HomeScreenPage();
      case 1:
        return UserOrders();
      case 2:
        return UserProfile();
    }
    return HomeScreenPage();
  }

  _getBottomOptions() {
    return [
      /// Home
      SalomonBottomBarItem(
        icon: Icon(Icons.home_filled),
        title: Text("Home"),
        selectedColor: AppColors.primaryLight,
      ),

      /// Likes
      SalomonBottomBarItem(
        icon: Icon(Icons.local_grocery_store),
        title: Text("Orders"),
        selectedColor: AppColors.primaryLight,
      ),

      /// Profile
      SalomonBottomBarItem(
        icon: Icon(Icons.person),
        title: Text("Profile"),
        selectedColor: AppColors.primaryLight,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteText,
        leading: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
            child: Container(
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(1.0),
              color: AppColors.whiteText,
              child: Container(
                padding: EdgeInsets.all(3.0),
                color: AppColors.whiteText,
                child: Center(
                  child: Image(
                    image: AssetImage('assets/images/device_pe.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "DevicePe",
          style: TextStyle(
              color: AppColors.primaryLight, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            //color: Colors.purple.withOpacity(0.1),
            child: IconButton(
              icon: Icon(
                Icons.location_pin,
                color: AppColors.primaryDark, //Colors.purpleAccent,
              ),
              onPressed: () {
                Get.to(() => SelectCity());
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        color: AppColors.whiteText,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          child: Container(
            color: AppColors.bgColor,
            child: SalomonBottomBar(
              currentIndex: _currentIndex,
              onTap: (i) => setState(() => _currentIndex = i),
              items: _getBottomOptions(),
              margin: EdgeInsets.all(5.0),
            ),
          ),
        ),
      ),
      body: _getPage(),
    );
  }
}
