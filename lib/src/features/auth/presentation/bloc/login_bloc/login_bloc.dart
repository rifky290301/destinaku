import 'package:destinaku/src/core/helper/helper.dart';
import 'package:destinaku/src/core/network/error/failures.dart';
import 'package:destinaku/src/features/auth/domain/entities/user.dart';
import 'package:destinaku/src/features/auth/domain/usecase/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase authUseCase;

  LoginBloc(this.authUseCase) : super(LoginInitial()) {
    on<RequestLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final result = await authUseCase.call(event.user);
        result.fold((l) {
          if (l is CancelTokenFailure) {
            emit(LoginLoading());
          } else {
            emit(const LoginFailure(error: 'Login gagal. Username atau password salah.'));
          }
        }, (r) async {
          Helper.setDataUserLocal(r);
          emit(LoginSuccess());
          print('berhasillll ');
          // navigatorKey.currentState?.pushReplacement(
          //   MaterialPageRoute(builder: (_) => const HomePage()),
          // );
        });
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
