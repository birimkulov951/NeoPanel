// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTeacher _$UpdateTeacherFromJson(Map<String, dynamic> json) {
  return UpdateTeacher(
    json['id'] as int,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['cityId'] as int,
    json['phone'] as String,
  );
}

Map<String, dynamic> _$UpdateTeacherToJson(UpdateTeacher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'cityId': instance.cityId,
      'phone': instance.phone,
    };
