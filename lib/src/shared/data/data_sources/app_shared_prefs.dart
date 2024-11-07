import 'package:destinaku/src/core/utils/constant/local_storage_constants.dart';
import 'package:destinaku/src/shared/domain/entities/language_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  //* ===============================================================
  //* Set language in app
  //* ===============================================================
  LanguageEnum? get getLang {
    String? data = _preferences.getString(lang);
    if (data == null) {
      return LanguageEnum.en;
    }
    return LanguageEnum.values.firstWhere((element) => element.name == data);
  }

  set setLang(LanguageEnum language) {
    _preferences.setString(lang, language.name);
  }

  //* ===============================================================
  //* Set setting dark or light mode
  //* ===============================================================
  bool get getIsDarkTheme => _preferences.getBool(theme) ?? false;

  set setDarkTheme(bool isDark) {
    _preferences.setBool(theme, isDark);
  }

  //* ===============================================================
  //* Keep token JWT for use in http request
  //* ===============================================================
  String get getToken => _preferences.getString(token) ?? '';

  set setToken(String tokenJWT) {
    _preferences.setString(token, tokenJWT);
  }
}
