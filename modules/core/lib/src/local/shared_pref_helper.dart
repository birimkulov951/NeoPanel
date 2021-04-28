import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  final SharedPreferences preferences;
  SharedPrefHelper({this.preferences});

  static const AUTH_TOKEN = 'auth_token';
  static const AUTH_TOKEN_EXPIRATION = "auth_token_expiration";
  static const TEMP_TOKEN = "temp_token";

  static const LAST_CHECKED = "last_checked";
  static const CHECK_INTERVAL = "check_interval";
  static const DATA = "data";
  static const THEME = "theme";

  //set data into shared preferences like this
  Future<void> setAuthToken(String authToken) async {
    preferences.setString(AUTH_TOKEN, authToken);
  }

  //get value from shared preferences
  Future<String> getAuthToken() async {
    var pref = await SharedPreferences.getInstance();
    String authToken;
    authToken = pref.getString(AUTH_TOKEN) ?? null;
    return authToken;
  }

  //set data into shared preferences like this
  Future<void> setTokenExpiration(String tokenExpiration) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(AUTH_TOKEN_EXPIRATION, tokenExpiration);
  }

  //get value from shared preferences
  Future<String> getTokenExpiration() async {
    String tokenExpiration;
    tokenExpiration = preferences.getString(AUTH_TOKEN_EXPIRATION) ?? null;
    return tokenExpiration;
  }

  Future setTempToken(String tempToken) async {
    preferences.setString(TEMP_TOKEN, tempToken);
  }

  Future<String> getTempToken() async {
    String tempToken;
    tempToken = preferences.getString(TEMP_TOKEN) ?? null;
    return tempToken;
  }

  // Interval 30000 means handle cache for 300000 milliseconds or 0.5 minute
  Future<bool> storeCache(String key, String json,
      {int lastChecked, int interval = 3000}) {
    if (lastChecked == null) {
      lastChecked = DateTime.now().millisecondsSinceEpoch;
    }
    return preferences.setString(
        key,
        jsonEncode(
            {LAST_CHECKED: lastChecked, CHECK_INTERVAL: interval, DATA: json}));
  }

  Future<String> getCache(String key) async {
    Map map = jsonDecode(preferences.getString(key));
    // if outdated, clear and return null
    var lastChecked = map[LAST_CHECKED];
    var interval = map[CHECK_INTERVAL];
    if ((DateTime.now().millisecondsSinceEpoch - lastChecked) > interval) {
      preferences.remove(key);
      return null;
    }
    return map[DATA];
  }

  Future<bool> storePermanentCachePermanent(String key, String json) {
    //preferences.remove(key);
    return preferences.setString(key, jsonEncode({DATA: json}));
  }

  Future<String> getPermanentCachePermanent(String key) async {
    Map map = jsonDecode(preferences.getString(key));
    return map[DATA];
  }

  Future<Map> getFullCache(String key) async {
    Map map = jsonDecode(preferences.getString(key));
    // if outdated, clear and return null
    var lastChecked = map[LAST_CHECKED];
    var interval = map[CHECK_INTERVAL];
    if ((DateTime.now().millisecondsSinceEpoch - lastChecked) > interval) {
      preferences.remove(key);
      return null;
    }
    return map;
  }

  Future saveValueDarkTheme(bool value) async {
    preferences.setBool(THEME, value);
  }

  Future<bool> getValueDarkTheme() async {
    return preferences.getBool(THEME) ?? false;
  }
}
