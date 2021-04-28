import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const THEME_STATUS = "THEMESTATUS";
  static const BRAND_SELECTION = "BRAND_SELECTION";
  static const VARIENT_SELECTION = "VARIENT_SELECTION";
  static const ACCESSORY_ID = "ACCESSORY_ID";
  static const MODEL_ID = "MODEL_ID";
  static const VARIANT_ID = "VARIANT_ID";

  saveString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> readString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? null;
  }

  saveInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int> readInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? -1;
  }

  saveBrandSelection(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(BRAND_SELECTION, value);
  }

  Future<int> getSelectedBrand() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(BRAND_SELECTION) ?? -1;
  }

  saveVariantSelection(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(VARIENT_SELECTION, value);
  }

  Future<int> getSelectedVarientId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(VARIENT_SELECTION) ?? 12;
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
