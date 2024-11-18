part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RequestRegisterEvent extends RegisterEvent {
  final User user;

  const RequestRegisterEvent({
    required this.user,
  });
}
