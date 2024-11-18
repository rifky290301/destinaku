import '../../core/network/dio_network.dart';
import '../../core/utils/injections.dart';
import 'data/datasources/local/auth_shared_prefs.dart';
import 'data/datasources/remote/auth_impl_api.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/abstract_auth_repository.dart';
import 'domain/usecase/login_usecase.dart';
import 'domain/usecase/register_usecase.dart';

initAuthInjections() {
  sl.registerSingleton<AuthImplApi>(AuthImplApi(DioNetwork.appAPI));
  sl.registerSingleton<AbstractAuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<AuthSharedPrefs>(AuthSharedPrefs(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
}
