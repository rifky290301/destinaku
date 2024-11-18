import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/helper.dart';
import '../../../../../core/network/error/failures.dart';
import '../../../../../core/router/app_page.dart';
import '../../../../home/presentation/pages/home_page.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecase/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(RegisterUseCase regsiterUseCase) : super(RegisterInitial()) {
    on<RequestRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final result = await regsiterUseCase.call(event.user);
        result.fold((l) {
          if (l is CancelTokenFailure) {
            emit(RegisterLoading());
          } else {
            emit(const RegisterFailure(error: 'Register gagal. Username atau password salah.'));
          }
        }, (r) async {
          Helper.setDataUserLocal(r);
          emit(RegisterSuccess());
// ! SEPERTINYA BELUM BISA DIGUNAKAN
          navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        });
      } catch (error) {
        emit(RegisterFailure(error: error.toString()));
      }
    });
  }
}
