import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  static SPHelper defaultHelper = new SPHelper();

  Future<bool> save(SPKey key, dynamic value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (value is bool) {
      return await preferences.setBool(
        key.toString(),
        value,
      );
    } else if (value is int) {
      return await preferences.setInt(
        key.toString(),
        value,
      );
    } else if (value is double) {
      return await preferences.setDouble(
        key.toString(),
        value,
      );
    } else {
      return await preferences.setString(
        key.toString(),
        value,
      );
    }
  }

  // Future<bool> saveBoolean(SPKey key, bool value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return await preferences.setBool(
  //     key.toString(),
  //     value,
  //   );
  // }

  // Future<bool> saveString(SPKey key, String value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return await preferences.setString(
  //     key.toString(),
  //     value,
  //   );
  // }

  Future<dynamic> get(SPKey key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(key.toString());
  }

  Future<bool> getBoolean(SPKey key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key.toString());
  }

  Future<String> getString(SPKey key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key.toString());
  }

  Future<int> getInt(SPKey key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key.toString());
  }

  Future<double> getDouble(SPKey key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getDouble(key.toString());
  }
}

enum SPKey {
  USER_DB_ID,
  USER_DISPLAY_ID,
  USER_TYPE,
  USERNAME,
  IS_LOGGED_IN,
}
