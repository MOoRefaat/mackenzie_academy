import 'package:mackenzie_academy/core/shared_preference/shared_preference_keys.dart';
import 'package:mackenzie_academy/core/shared_preference/shered_prefrence_utlis.dart';

class SharedPreferenceManager {
  final SharedPreferencesUtils sharedPreferencesUtils;

  SharedPreferenceManager({required this.sharedPreferencesUtils});

  setLang(String data) {
    return sharedPreferencesUtils.saveData<String>(
        SharedPreferenceKeys.lang, data);
  }

  Future<String> getLang() async {
    return await sharedPreferencesUtils
            .getData<String>(SharedPreferenceKeys.lang) ??
        'en';
  }

  setMode(bool value) {
    return sharedPreferencesUtils.saveData<bool>(
        SharedPreferenceKeys.mode, value);
  }

  Future<bool> getMode() async {
    final isDark =
        await sharedPreferencesUtils.getData(SharedPreferenceKeys.mode) ??
            false;

    print("getMode : ${isDark}");
    if (isDark == "true") {
      return true;
    } else {
      return false;
    }
  }

  setUsername(String data) {
    return sharedPreferencesUtils.saveData<String>(
        SharedPreferenceKeys.username, data);
  }

  Future<String> getUsername() async {
    return await sharedPreferencesUtils
            .getData(SharedPreferenceKeys.username) ??
        "";
  }

  setRole(String data) async {
    return await sharedPreferencesUtils.saveData<String>(
        SharedPreferenceKeys.password, data);
  }

  Future<String> getRole() async {
    return await sharedPreferencesUtils
            .getData(SharedPreferenceKeys.password) ??
        "";
  }

  setIsRememberMe(bool value) async {
    return sharedPreferencesUtils
      ..saveData<bool>(SharedPreferenceKeys.rememberMe, value);
  }

  Future<bool> getIsRememberMe() async {
    final IsRememberMe =
        await sharedPreferencesUtils.getData(SharedPreferenceKeys.rememberMe);
    if (IsRememberMe == "true") {
      return true;
    } else {
      return false;
    }
  }

  setPassword(String data) async {
    return await sharedPreferencesUtils.saveData<String>(
        SharedPreferenceKeys.role, data);
  }

  Future<String> getPassword() async {
    return await sharedPreferencesUtils.getData(SharedPreferenceKeys.role) ??
        "";
  }
}
