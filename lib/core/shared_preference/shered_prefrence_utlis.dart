import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt_shared_preferences/provider.dart';

class SharedPreferencesUtils {

  static SharedPreferences? sharedPreferences;


  // static Future<SharedPreferences> get _instance async =>
  //     sharedPreferences ??= await EncryptedSharedPreferences().getInstance();
  //

  static Future<SharedPreferences?> get _instance async =>
      sharedPreferences ??= (await EncryptedSharedPreferences.getInstance()) as SharedPreferences?;



  static final SharedPreferencesUtils _sharedPreference = SharedPreferencesUtils._internal();

  factory SharedPreferencesUtils() {
    return _sharedPreference;
  }

  SharedPreferencesUtils._internal();

  static Future<bool> setString(String key, String data) async {
    // TODO: check about "!"
    return (await _instance)!.setString(key, data);
  }

  static Future<String?> getString(String key) async {
    return (await _instance)!.getString(key);
  }

  static Future<bool> setInt(String key, int data) async {
    return (await _instance)!.setInt(key, data);
  }

  static Future<int?> getInt(String key) async {
    return (await _instance)!.getInt(key);
  }

  static Future<bool?> setBool(String key, {required bool? data}) async {
    return (await _instance)!.setBool(key, data!);
  }

  static Future<bool?> getBool(String? key) async {
    var result = (await _instance)!.getBool(key!);
    if (result != null) {
      return result;
    } else {
      return false;
    }
  }

  static Future<bool?> remove(String key) async {
    return (await _instance)!.remove(key);
  }

  static Future clearData() async {
    return (await _instance)!.clear();
  }

}
