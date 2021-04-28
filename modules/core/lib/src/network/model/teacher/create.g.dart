// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTeacher _$CreateTeacherFromJson(Map<String, dynamic> json) {
  return CreateTeacher(
    json['id'] as int,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['cityId'] as int,
    json['phone'] as String,
  );
}

Map<String, dynamic> _$CreateTeacherToJson(CreateTeacher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'cityId': instance.cityId,
      'phone': instance.phone,
    };
