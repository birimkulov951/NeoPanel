// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCourse _$UpdateCourseFromJson(Map<String, dynamic> json) {
  return UpdateCourse(
    json['id'] as int,
    json['name'] as String,
    json['cityId'] as int,
    json['teacherId'] as int,
    json['color'] as String,
  );
}

Map<String, dynamic> _$UpdateCourseToJson(UpdateCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cityId': instance.cityId,
      'teacherId': instance.teacherId,
      'color': instance.color,
    };
