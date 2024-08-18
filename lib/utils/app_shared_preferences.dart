import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  int index=0;

  /// Save Bool [key] the key for save value [value] the value we need to save it
  static Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool(key, value);
  }

  /// Get Bool [key] the key was saved
  static Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.containsKey(key)) {
      return prefs.getBool(key);
    } else {
      return null;
    }
  }

  /// Get Int [key] the key was saved
  static Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  /// clear all saved values in shared preferences
  static Future<void> clear() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }

  /// remove value based on [key] the key was saved
  static Future<void> remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}
