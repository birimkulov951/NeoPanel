// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCourse _$CreateCourseFromJson(Map<String, dynamic> json) {
  return CreateCourse(
    json['name'] as String,
    json['cityId'] as int,
    json['teacherId'] as int,
    json['color'] as String,
  );
}

Map<String, dynamic> _$CreateCourseToJson(CreateCourse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cityId': instance.cityId,
      'teacherId': instance.teacherId,
      'color': instance.color,
    };
