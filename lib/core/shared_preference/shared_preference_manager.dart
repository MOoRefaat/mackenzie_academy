import 'package:mackenzie_academy/core/shared_preference/shared_preference_keys.dart';
import 'package:mackenzie_academy/core/shared_preference/shered_prefrence_utlis.dart';

class SharedPreferenceManager {

  static final SharedPreferenceManager _sharedPreference = SharedPreferenceManager._internal();

  factory SharedPreferenceManager() {
    return _sharedPreference;
  }

  SharedPreferenceManager._internal();

  Future<bool> setLang(String data) async {
    return await SharedPreferencesUtils.setString(
        SharedPreferenceKeys.lang, data);
  }

  Future<String> getLang() async {
    return await SharedPreferencesUtils.getString(SharedPreferenceKeys.lang) ??
        "";
  }

  Future<void> setMode(bool value) async {
    await SharedPreferencesUtils.setBool(SharedPreferenceKeys.mode, data: value);
  }

  Future<bool> getMode() async {
    return await SharedPreferencesUtils.getBool(SharedPreferenceKeys.mode) ?? false;
  }

  Future<bool> setUsername(String data) async {
    return await SharedPreferencesUtils.setString(
        SharedPreferenceKeys.username, data);
  }

  Future<String> getUsername() async {
    return await SharedPreferencesUtils.getString(SharedPreferenceKeys.username) ??
        "";
  }

  Future<bool> setPassword(String data) async {
    return await SharedPreferencesUtils.setString(
        SharedPreferenceKeys.password, data);
  }

  Future<String> getPassword() async {
    return await SharedPreferencesUtils.getString(SharedPreferenceKeys.password) ??
        "";
  }

}