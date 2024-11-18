import 'package:destinaku/src/core/utils/constant/local_storage_constants.dart';
import 'package:destinaku/src/shared/domain/entities/language_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  //* ===============================================================
  //* Set language in app
  //* ===============================================================
  LanguageEnum get getLang {
    String? data = _preferences.getString(LocalStorageConstants.lang);
    if (data == null) return LanguageEnum.id;
    return LanguageEnum.values.firstWhere((element) => element.name == data);
  }

  set setLang(LanguageEnum language) {
    _preferences.setString(LocalStorageConstants.lang, language.name);
  }

  //* ===============================================================
  //* Set setting dark or light mode
  //* ===============================================================
  bool get getIsDarkTheme => _preferences.getBool(LocalStorageConstants.theme) ?? false;

  set setDarkTheme(bool isDark) {
    _preferences.setBool(LocalStorageConstants.theme, isDark);
  }

  //* ===============================================================
  //* Keep token JWT for use in http request
  //* ===============================================================
  String get getToken => _preferences.getString(LocalStorageConstants.token) ?? '';

  set setToken(String tokenJWT) {
    _preferences.setString(LocalStorageConstants.token, tokenJWT);
  }

  //* ===============================================================
  //* check if you have passed Onboarding
  //* ===============================================================
  bool get getOnBoarding => _preferences.getBool(LocalStorageConstants.haveSeenOnboarding) ?? false;

  set setOnBoarding(bool value) {
    _preferences.setBool(LocalStorageConstants.haveSeenOnboarding, value);
  }
}
