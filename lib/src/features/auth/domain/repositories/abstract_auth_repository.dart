import 'package:dartz/dartz.dart';

import '../../../../core/network/error/failures.dart';
import '../entities/user.dart';

abstract class AbstractAuthRepository {
  Future<Either<Failure, User>> login(User params);
  Future<Either<Failure, User>> register(User params);
}
