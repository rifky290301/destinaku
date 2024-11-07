// Required params for this use-case
import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  @override
  List<Object?> get props => [email, password];
}
