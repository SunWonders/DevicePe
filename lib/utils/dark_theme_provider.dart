import 'package:flutter/cupertino.dart';

import 'sahred_pref.dart';

class DarkThemeProvider with ChangeNotifier {
  SharedPref darkThemePreference = SharedPref();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
