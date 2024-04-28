import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';

class SharedPreCacheHelper {
  final SharedPreferences preferences;

  SharedPreCacheHelper(this.preferences);

  getData({
    required String key,
  }) async {
    return preferences.get(key);
  }

  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await preferences.setString(key, value);
    if (value is int) return await preferences.setInt(key, value);
    if (value is bool) return await preferences.setBool(key, value);

    return await preferences.setDouble(key, value);
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await preferences.remove(key);
  }



   Future<void> setCustomerId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constant.customerIdKey, id);
  }

   Future<String?> getCustomerId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constant.customerIdKey);
  }
}
