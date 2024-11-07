import 'package:dartz/dartz.dart';
import 'package:destinaku/src/core/network/error/failures.dart';
import 'package:destinaku/src/features/auth/domain/models/login_params.dart';
import 'package:destinaku/src/shared/domain/models/user_model.dart';

abstract class AbstractAuthRepository {
  // Gent Ny Times Articles
  Future<Either<Failure, String>> login(LoginParams params);
  Future<Either<Failure, UserModel>> register(UserModel params);
}
