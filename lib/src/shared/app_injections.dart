import 'package:destinaku/src/core/utils/injections.dart';
import 'package:destinaku/src/shared/data/datasources/app_shared_prefs.dart';
import 'package:destinaku/src/shared/data/datasources/user_local.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
  sl.registerFactory<UserLocal>(() => UserLocal(sl()));
}
