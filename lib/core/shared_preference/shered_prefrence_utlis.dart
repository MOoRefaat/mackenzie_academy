import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPreferencesUtils {
  late FlutterSecureStorage secureStorage;
  late SharedPreferences sharedPreferences;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding);

  SharedPreferencesUtils() {
    secureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  Future<void> saveData<T>(String key, T value) async {
    if (value is String || value is int || value is double || value is bool) {
      await secureStorage.write(key: key, value: value.toString());
    }
  }

  Future<dynamic> getData<T>(String key) async {
    final storedValue = await secureStorage.read(key: key);

    if (storedValue != null) {

      // If the type is one of the supported types or nullable versions, cast and return
      return storedValue as T?;

    }

    return null;

  }

  Future<void> removeData(String key) async {
    await secureStorage.delete(key: key);
  }

  Future<void> clearData() async {
    await secureStorage.deleteAll();
  }
}


// class SharedPreferencesUtils {
//   static SharedPreferences? _sharedPreferences;
//
//   static Future<SharedPreferences> get _instance async => _sharedPreferences ??= await EncryptedSharedPreferences.getInstance();
//
//   static final SharedPreferencesUtils _sharedPreference =
//       SharedPreferencesUtils._internal();
//
//   factory SharedPreferencesUtils() {
//     return _sharedPreference;
//   }
//
//   SharedPreferencesUtils._internal();
//
//   static Future<bool> setString(String key, String data) async {
//     return (await _instance).setString(key, data);
//   }
//
//   static Future<String?> getString(String key) async {
//     return (await _instance).getString(key);
//   }
//
//   static Future<bool> setInt(String key, int data) async {
//     return (await _instance).setInt(key, data);
//   }
//
//   static Future<int?> getInt(String key) async {
//     return (await _instance).getInt(key);
//   }
//
//   static Future<bool> setBool(String key, bool data) async {
//     return (await _instance).setBool(key, data);
//   }
//
//   static Future<bool> getBool(String key) async {
//     return (await _instance).getBool(key) ?? false;
//   }
//
//   static Future<bool> remove(String key) async {
//     return (await _instance).remove(key);
//   }
//
//   static Future<void> clearData() async {
//     await (await _instance).clear();
//   }
// }
