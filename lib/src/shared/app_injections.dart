import 'package:destinaku/src/core/utils/injections.dart';
import 'package:destinaku/src/shared/data/data_sources/app_shared_prefs.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
}
