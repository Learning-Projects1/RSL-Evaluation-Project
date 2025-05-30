

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {

  static Future<bool> setPrefBoolean(String key,bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key,value);
  }

  static Future<bool> getPrefBoolean(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(value) ?? false;
  }

  static Future<void> setPrefString(String key,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key,value);
  }

  static Future<String> getPrefString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }


  static Future<void> setPrefDouble(String key,double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key,value);
  }

  static Future<double> getPrefDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future<void> clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }


}