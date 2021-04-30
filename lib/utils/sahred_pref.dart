import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const SINGLE_SELECTION = "Single Selection";
  static const MULTIPLE_SELECTION = "MULTIPLE_SELECTION";
  static const THEME_STATUS = "THEMESTATUS";
  static const BRAND_SELECTION = "BRAND_SELECTION";
  static const VARIENT_SELECTION = "VARIENT_SELECTION";
  static const ACCESSORY_ID = "ACCESSORY_ID";
  static const MODEL_ID = "MODEL_ID";
  static const VARIANT_ID = "VARIANT_ID";
  static const BASE_PRICE = "BASE_PRICE";
  static const JWT_TOKEN = "JWT_TOKEN";
  static const CHECK_LIST_AMOUNT = "CHECK_LIST_AMOUNT";
  static const ACCESSORIES_PRICE = "ACCESSORIES_PRICE";
  static const DEVICE_CONDITION = "DEVICE_CONDITION";

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

  saveDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<double> readDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0;
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
