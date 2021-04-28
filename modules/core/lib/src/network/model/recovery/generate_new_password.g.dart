// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_new_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateNewPasswordResult _$GenerateNewPasswordResultFromJson(
    Map<String, dynamic> json) {
  return GenerateNewPasswordResult(
    json['code'] as int,
    json['email'] as String,
  );
}

Map<String, dynamic> _$GenerateNewPasswordResultToJson(
        GenerateNewPasswordResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'email': instance.email,
    };

GenerateNewPassword _$GenerateNewPasswordFromJson(Map<String, dynamic> json) {
  return GenerateNewPassword(
    json['code'] as int,
    json['email'] as String,
  );
}

Map<String, dynamic> _$GenerateNewPasswordToJson(
        GenerateNewPassword instance) =>
    <String, dynamic>{
      'code': instance.code,
      'email': instance.email,
    };
