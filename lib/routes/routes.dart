import 'package:devicepe_client/ui/get_started.dart';
import 'package:devicepe_client/ui/home/home.dart';
import 'package:devicepe_client/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterPath {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case getStarted:
        return MaterialPageRoute(builder: (_) => GetStartedPage());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

launchScreen(context, String path) {
  Navigator.pushReplacementNamed(context, path);
}

const String initialRoute = '/';
const String getStarted = '/getStarted';
const String home = '/home';
