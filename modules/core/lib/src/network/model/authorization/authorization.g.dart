// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationResult _$AuthorizationResultFromJson(Map<String, dynamic> json) {
  return AuthorizationResult(
    json['token'] as String,
    json['expiration'] as String,
  );
}

Map<String, dynamic> _$AuthorizationResultToJson(
        AuthorizationResult instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiration': instance.expiration,
    };

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) {
  return Authorization(
    json['email'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
