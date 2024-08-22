import 'package:mackenzie_academy/core/shared_preference/shared_preference_keys.dart';
import 'package:mackenzie_academy/core/shared_preference/shered_prefrence_utlis.dart';

class SharedPreferenceManager {

  final SharedPreferencesUtils sharedPreferencesUtils;

  SharedPreferenceManager({required this.sharedPreferencesUtils});

  // static final SharedPreferenceManager _sharedPreference = SharedPreferenceManager._internal();
  //
  // factory SharedPreferenceManager() {
  //   return _sharedPreference;
  // }
  //
  // SharedPreferenceManager._internal();

  setLang(String data) {
    return sharedPreferencesUtils.saveData<String>(SharedPreferenceKeys.lang, data);
  }

  Future<String> getLang() async {
    return await sharedPreferencesUtils.getData<String>(SharedPreferenceKeys.lang);
  }

  setMode(bool value)  {
    return sharedPreferencesUtils.saveData<bool>(SharedPreferenceKeys.mode, value);
  }

  Future<bool> getMode() async {
    return await sharedPreferencesUtils.getData(SharedPreferenceKeys.mode) ?? false;
  }

   setUsername(String data)  {
    return sharedPreferencesUtils.saveData<String>(SharedPreferenceKeys.username, data);
  }

  Future<String> getUsername() async {
    return await sharedPreferencesUtils.getData(SharedPreferenceKeys.username) ??
        "";
  }

  setRole(String data) async {
    return await sharedPreferencesUtils.saveData<String>(
        SharedPreferenceKeys.password, data);
  }

  Future<String> getRole() async {
    return await sharedPreferencesUtils.getData(SharedPreferenceKeys.password) ??
        "";
  }

   setIsRememberMe(bool value) async {
    return sharedPreferencesUtils..saveData<bool>(SharedPreferenceKeys.rememberMe, value);
  }

  Future<bool> getIsRememberMe() async {
    final isss = await sharedPreferencesUtils.getData(SharedPreferenceKeys.rememberMe);
    if(isss == "true"){
      return true;
    } else
        return false;
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