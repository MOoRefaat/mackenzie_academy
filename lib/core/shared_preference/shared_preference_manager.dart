import 'package:mackenzie_academy/core/shared_preference/shared_preference_keys.dart';
import 'package:mackenzie_academy/core/shared_preference/shered_prefrence_utlis.dart';

class SharedPreferenceManager {

  static final SharedPreferenceManager _sharedPreference = SharedPreferenceManager._internal();

  factory SharedPreferenceManager() {
    return _sharedPreference;
  }

  SharedPreferenceManager._internal();




}