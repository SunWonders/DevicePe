import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const THEME_STATUS = "THEMESTATUS";
  static const BRAND_SELECTION = "BRAND_SELECTION";

  saveBrandSelection(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(BRAND_SELECTION, value);
  }

  Future<int> getSelectedBrand() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(BRAND_SELECTION) ?? -1;
  }

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
