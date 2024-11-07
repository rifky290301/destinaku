import 'package:dartz/dartz.dart';
import 'package:destinaku/src/core/network/error/exceptions.dart';
import 'package:destinaku/src/core/network/error/failures.dart';
import 'package:destinaku/src/features/auth/data/data_source/remote/auth_impl_api.dart';
import 'package:destinaku/src/features/auth/domain/models/login_params.dart';
import 'package:destinaku/src/features/auth/domain/repositories/abstract_auth_repository.dart';
import 'package:destinaku/src/shared/domain/models/user_model.dart';

class AuthRepositoryImpl extends AbstractAuthRepository {
  final AuthImplApi authApi;

  AuthRepositoryImpl(this.authApi);

  @override
  Future<Either<Failure, String>> login(LoginParams params) async {
    try {
      final result = await authApi.login(params);
      return Right(result.data ?? '');
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(UserModel params) async {
    try {
      final result = await authApi.register(params);
      return Right(result.data ?? UserModel());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
