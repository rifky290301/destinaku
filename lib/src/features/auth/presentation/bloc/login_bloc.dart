import 'package:destinaku/src/core/network/error/failures.dart';
import 'package:destinaku/src/core/router/app_page.dart';
import 'package:destinaku/src/core/utils/injections.dart';
import 'package:destinaku/src/core/utils/log/app_logger.dart';
import 'package:destinaku/src/features/auth/domain/models/login_params.dart';
import 'package:destinaku/src/features/auth/domain/usecase/auth_usecase.dart';
import 'package:destinaku/src/shared/data/data_sources/app_shared_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase authUseCase;

  LoginBloc(this.authUseCase) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final result = await authUseCase.call(
          LoginParams(
            email: event.email,
            password: event.password,
          ),
        );
        result.fold((l) {
          if (l is CancelTokenFailure) {
            emit(LoginLoading());
          } else {
            emit(const LoginFailure(error: 'Login gagal. Username atau password salah.'));
          }
        }, (r) async {
          sl<AppSharedPrefs>().setToken = r;
          emit(LoginSuccess());
          // await Future.delayed(
          //   const Duration(milliseconds: 1000),
          //   () => AppPage.router.pushReplacement(Routes.HOME),
          // );
        });
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
