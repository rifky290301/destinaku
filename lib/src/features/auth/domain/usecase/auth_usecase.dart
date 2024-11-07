import 'package:dartz/dartz.dart';
import 'package:destinaku/src/core/network/error/failures.dart';
import 'package:destinaku/src/core/utils/usecase/usecase.dart';
import 'package:destinaku/src/features/auth/domain/models/login_params.dart';
import 'package:destinaku/src/features/auth/domain/repositories/abstract_auth_repository.dart';

class AuthUseCase extends UseCase<String, LoginParams> {
  final AbstractAuthRepository repository;

  AuthUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    final result = await repository.login(params);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
