// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCurrentUser _$UpdateCurrentUserFromJson(Map<String, dynamic> json) {
  return UpdateCurrentUser(
    json['id'] as int,
    json['username'] as String,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['cityId'] as int,
    json['phoneNumber'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$UpdateCurrentUserToJson(UpdateCurrentUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'cityId': instance.cityId,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
