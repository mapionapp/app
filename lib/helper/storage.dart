import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('firstTime') ?? true;
    return firstTime;
  }

  static Future<void> setFirstTime(bool firstTime) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', firstTime);
  }
}