import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/network/error/dio_error_handler.dart';
import '../../../../../core/network/error/exceptions.dart';
import '../../../domain/entities/user.dart' as u;
import '../../models/user_model.dart';
import 'abstrac_auth_api.dart';

class AuthImplApi extends AbstractAuthApi {
  final firebaseAuth = FirebaseAuth.instance;
  final Dio dio;

  AuthImplApi(this.dio);

  @override
  Future<UserModel> login(u.User params) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: params.email!,
        password: params.password!,
      );

      final User? user = firebaseAuth.currentUser;

      return UserModel(
        email: user?.email ?? '',
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  @override
  Future<UserModel> register(u.User params) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: params.email!,
        password: params.password!,
      );
      // return UserModel.fromJson('', const {'': ''});
      return UserModel(
        email: params.email ?? '',
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  @override
  Future<List<UserModel>> getAllUser() async {
    try {
      final result = await dio.get('/users');
      // return ApiResponse<List<UserModel>>.fromJson(const {'': ''});
      return [];
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
  Future<UserModel> getUser() async {
    try {
      final User? user = firebaseAuth.currentUser;

      return UserModel(
        email: user?.email ?? '',
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
