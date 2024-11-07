import 'package:destinaku/src/shared/domain/models/extensions/converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    final String? id,
    final String? userName,
    final String? email,
    final String? passwordHash,
    final String? address,
    final String? phoneNumber,
    final String? profilePicture,
    final String? instagramLink,
    final String? description,
    final RoleEnum? role,
    @MillisecondEpochConverter() final DateTime? createdAt,
    @MillisecondEpochConverter() final DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

enum RoleEnum { buyer, seller }
