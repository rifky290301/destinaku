import 'package:destinaku/src/features/auth/domain/models/login_params.dart';
import 'package:destinaku/src/shared/domain/models/api_response.dart';
import 'package:destinaku/src/shared/domain/models/user_model.dart';

abstract class AbstractAuthApi {
  Future<ApiResponse<String>> login(LoginParams params);
  Future<ApiResponse<UserModel>> register(UserModel params);
}
