import 'dart:convert';

import 'package:destinaku/src/features/auth/data/models/user_model.dart';
import 'package:destinaku/src/features/auth/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocal {
  final SharedPreferences _preferences;

  UserLocal(this._preferences);

  //* ===============================================================
  //* Set user to local after login
  //* ===============================================================
  set setUserModel(UserModel user) {
    _preferences.setString('user', jsonEncode(user.toJson()));
  }

  User? get getUser {
    var user = _preferences.getString('user');
    if (user != null) {
      var json = jsonDecode(user);
      return UserModel.fromJson('', json);
    }
    return null;
  }
}
