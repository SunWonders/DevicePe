import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devicepe_client/routes/routes.dart';
import 'package:devicepe_client/utils/dark_theme_provider.dart';
import 'package:devicepe_client/utils/styles.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(BaseApp());
}

class BaseApp extends StatefulWidget {
  @override
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: initialRoute,
            onGenerateRoute: RouterPath.generateRoute,
          );
        },
      ),
    );
  }
}
