import 'package:destinaku/src/core/utils/injections.dart';
import 'package:destinaku/src/features/auth/data/models/user_model.dart';
import 'package:destinaku/src/features/auth/domain/entities/user.dart';
import 'package:destinaku/src/shared/data/datasources/app_shared_prefs.dart';
import 'package:destinaku/src/shared/data/datasources/user_local.dart';
import 'package:destinaku/src/shared/domain/entities/language_enum.dart';

class Helper {
  Helper._();

  /// Get and set language
  static LanguageEnum get getLang => sl<AppSharedPrefs>().getLang;
  static void setLang(LanguageEnum value) => sl<AppSharedPrefs>().setLang = value;

  /// Get and set dark mode
  static bool get isDarkTheme => sl<AppSharedPrefs>().getIsDarkTheme;
  static void setDarkTheme(bool value) => sl<AppSharedPrefs>().setDarkTheme = value;

  /// Get and set dark mode
  static bool get isHaveSeenOnboarding => sl<AppSharedPrefs>().getOnBoarding;
  static void setHaveSeenOnboarding(bool value) => sl<AppSharedPrefs>().setOnBoarding = value;

  /// Get and set user save local
  static User? get getDataUserLocal => sl<UserLocal>().getUser;
  static void setDataUserLocal(User value) {
    sl<UserLocal>().setUserModel = UserModel(
      id: value.id,
      name: value.name,
      email: value.email,
    );
  }

  /// Get Dio Header
  static Map<String, dynamic> getHeaders() {
    return {}..removeWhere((key, value) => value == null);
  }
}
