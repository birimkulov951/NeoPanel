// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_forgot_password_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateForgotPasswordResult _$GenerateForgotPasswordResultFromJson(
    Map<String, dynamic> json) {
  return GenerateForgotPasswordResult(
    json['code'] as int,
    json['email'] as String,
  );
}

Map<String, dynamic> _$GenerateForgotPasswordResultToJson(
        GenerateForgotPasswordResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'email': instance.email,
    };

GenerateForgotPassword _$GenerateForgotPasswordFromJson(
    Map<String, dynamic> json) {
  return GenerateForgotPassword(
    json['email'] as String,
  );
}

Map<String, dynamic> _$GenerateForgotPasswordToJson(
        GenerateForgotPassword instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
