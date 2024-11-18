import 'package:destinaku/src/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    super.id,
    super.email,
    super.password,
    super.name,
    super.address,
    super.mobilePhone,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      id: id,
      email: json['email'],
      name: json['name'],
      address: json['address'],
      mobilePhone: json['mobile_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "address": address,
      "mobile_phone": mobilePhone,
    };
  }

  // static List<UserModel> fromJsonList(List datas) {
  //   if (datas.isEmpty) return [];
  //   return datas.map((data) => UserModel.fromJson(data)).toList();
  // }
}
