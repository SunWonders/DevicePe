import 'package:devicepe_client/ui/home/home_screen.dart';
import 'package:devicepe_client/ui/orders/orders.dart';
import 'package:devicepe_client/ui/profile/user_profile.dart';
import 'package:devicepe_client/ui/select_city.dart';
import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

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
        backgroundColor: AppColors.primaryLight,
        title: Text(
          "DevicePe",
          style: TextStyle(color: AppColors.whiteText),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.location_pin,
              color: AppColors.whiteText,
            ),
            onPressed: () {
              Get.to(() => SelectCity());
            },
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColors.nutralLight,
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: _getBottomOptions(),
        ),
      ),
      body: _getPage(),
    );
  }
}
