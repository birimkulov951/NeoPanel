// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResult _$UsersResultFromJson(Map<String, dynamic> json) {
  return UsersResult(
    json['status'] as int,
    json['message'] as String,
    (json['responseObj'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsersResultToJson(UsersResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.results,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
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

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
