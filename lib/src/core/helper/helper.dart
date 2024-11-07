import 'package:destinaku/src/core/utils/injections.dart';
import 'package:destinaku/src/shared/data/data_sources/app_shared_prefs.dart';
import 'package:destinaku/src/shared/domain/entities/language_enum.dart';

class Helper {
  Helper._();

  /// Get language
  static LanguageEnum getLang() {
    LanguageEnum? lang;
    lang = sl<AppSharedPrefs>().getLang;
    lang = lang ?? LanguageEnum.en;
    return lang;
  }

  /// Get Dio Header
  static Map<String, dynamic> getHeaders() {
    return {}..removeWhere((key, value) => value == null);
  }

  static bool get isDarkTheme => sl<AppSharedPrefs>().getIsDarkTheme;
}
