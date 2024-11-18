import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? address;
  final String? mobilePhone;

  const User({
    this.id,
    this.email,
    this.password,
    this.name,
    this.address,
    this.mobilePhone,
  });

  @override
  List<Object?> get props => [id, email, password, name, address, mobilePhone];
}
