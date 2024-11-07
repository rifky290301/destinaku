import 'package:destinaku/src/core/network/error/dio_error_handler.dart';
import 'package:destinaku/src/core/network/error/exceptions.dart';
import 'package:destinaku/src/features/auth/data/data_source/remote/abstrac_auth_api.dart';
import 'package:destinaku/src/features/auth/domain/models/login_params.dart';
import 'package:destinaku/src/shared/domain/models/api_response.dart';
import 'package:destinaku/src/shared/domain/models/user_model.dart';
import 'package:dio/dio.dart';

class AuthImplApi extends AbstractAuthApi {
  final Dio dio;

  AuthImplApi(this.dio);

  @override
  Future<ApiResponse<String>> login(LoginParams params) async {
    try {
      final result = await dio.post(
        'login',
        data: params.toJson(),
      );
      if (result.data == null) throw ServerException("Unknown Error", result.statusCode);

      return ApiResponse<String>.fromJson(result.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  @override
  Future<ApiResponse<UserModel>> register(UserModel params) async {
    try {
      final result = await dio.post(
        'register',
        data: params.toJson(),
      );
      if (result.data == null) throw ServerException("Unknown Error", result.statusCode);

      return ApiResponse<UserModel>.fromJson(result.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
