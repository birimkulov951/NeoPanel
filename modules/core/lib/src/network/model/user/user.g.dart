// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUserResult _$CurrentUserResultFromJson(Map<String, dynamic> json) {
  return CurrentUserResult(
    json['id'] as int,
    json['username'] as String,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['cityName'] as String,
    json['phoneNumber'] as String,
    json['email'] as String,
    (json['roles'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CurrentUserResultToJson(CurrentUserResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'cityName': instance.cityName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'roles': instance.roles,
    };
