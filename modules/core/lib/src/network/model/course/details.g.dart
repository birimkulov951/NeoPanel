// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailsResult _$CourseDetailsResultFromJson(Map<String, dynamic> json) {
  return CourseDetailsResult(
    json['status'] as int,
    json['message'] as String,
    json['responseObj'] == null
        ? null
        : CourseD.fromJson(json['responseObj'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CourseDetailsResultToJson(
        CourseDetailsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.lead,
    };

CourseD _$CourseDFromJson(Map<String, dynamic> json) {
  return CourseD(
    json['id'] as int,
    json['name'] as String,
    json['teacher'] as String,
    json['color'] as String,
  );
}

Map<String, dynamic> _$CourseDToJson(CourseD instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teacher': instance.teacher,
      'color': instance.color,
    };
