import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefs {
  final SharedPreferences _preferences;

  AuthSharedPrefs(this._preferences);

  /// __________ Example __________ ///
  Future<bool> clearAllLocalData() async {
    return true;
  }
}
