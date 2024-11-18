part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class RequestLoginEvent extends LoginEvent {
  final User user;

  const RequestLoginEvent({
    required this.user,
  });
}
