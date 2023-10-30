

import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String minutesString = minutes.toString().padLeft(2, '0');
    String secondsString = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesString:$secondsString';
  }

  static Future<String> getAStoredString({
    required String key,
  }) async {
    final SharedPreferences storeData = await SharedPreferences.getInstance();
    return storeData.getString(key) ?? '';
  }

  static Future<bool> checkIfItsFirstLaunch() async {
    final SharedPreferences storeData = await SharedPreferences.getInstance();
    return storeData.getBool(ConstantKeys.kFirstTimeLaunch) ?? false;
  }

  static identifyAsFirstLaunch() async {
    final SharedPreferences storeData = await SharedPreferences.getInstance();
    storeData.setBool(ConstantKeys.kFirstTimeLaunch, true);
  }

  static storeAString({
    required String key,
    required String value,
  }) async {
    final SharedPreferences storeData = await SharedPreferences.getInstance();
    storeData.setString(key, value);
  }
}

class ConstantKeys {
  // Keys for shared preferences storage of data

  static const String kFirstTimeLaunch = 'FirstTimeLaunch';
  static const String kEmail = 'Email';
  static const String kPassword = 'Password';
  static const String kUsername = 'UserName';
}
