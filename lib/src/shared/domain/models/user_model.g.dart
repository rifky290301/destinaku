// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      userName: json['user_name'] as String?,
      email: json['email'] as String?,
      passwordHash: json['password_hash'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profilePicture: json['profile_picture'] as String?,
      instagramLink: json['instagram_link'] as String?,
      description: json['description'] as String?,
      role: $enumDecodeNullable(_$RoleEnumEnumMap, json['role']),
      createdAt: const MillisecondEpochConverter()
          .fromJson((json['created_at'] as num?)?.toInt()),
      updatedAt: const MillisecondEpochConverter()
          .fromJson((json['updated_at'] as num?)?.toInt()),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'email': instance.email,
      'password_hash': instance.passwordHash,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'profile_picture': instance.profilePicture,
      'instagram_link': instance.instagramLink,
      'description': instance.description,
      'role': _$RoleEnumEnumMap[instance.role],
      'created_at':
          const MillisecondEpochConverter().toJson(instance.createdAt),
      'updated_at':
          const MillisecondEpochConverter().toJson(instance.updatedAt),
    };

const _$RoleEnumEnumMap = {
  RoleEnum.buyer: 'buyer',
  RoleEnum.seller: 'seller',
};
