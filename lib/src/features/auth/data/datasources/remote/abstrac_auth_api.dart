import '../../../domain/entities/user.dart';
import '../../models/user_model.dart';

abstract class AbstractAuthApi {
  Future<UserModel> login(User params);
  Future<UserModel> register(User params);
  Future<List<UserModel>> getAllUser();
  Future<UserModel> getUser();
}
