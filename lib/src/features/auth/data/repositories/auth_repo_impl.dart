import 'package:dartz/dartz.dart';
import 'package:destinaku/src/core/network/error/exceptions.dart';

import '../../../../core/network/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/abstract_auth_repository.dart';
import '../datasources/remote/auth_impl_api.dart';

class AuthRepositoryImpl extends AbstractAuthRepository {
  final AuthImplApi authApi;

  AuthRepositoryImpl(this.authApi);

  @override
  Future<Either<Failure, User>> login(User params) async {
    try {
      final result = await authApi.login(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, User>> register(User params) async {
    try {
      final result = await authApi.register(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
