import 'package:dartz/dartz.dart';
import 'package:destinaku/src/features/auth/domain/entities/user.dart';

import '../../../../core/network/error/failures.dart';
import '../../../../core/utils/usecase/usecase.dart';
import '../repositories/abstract_auth_repository.dart';

class RegisterUseCase extends UseCase<User, User> {
  final AbstractAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(User params) async {
    final result = await repository.register(params);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
