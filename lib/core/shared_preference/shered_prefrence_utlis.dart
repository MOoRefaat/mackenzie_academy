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
