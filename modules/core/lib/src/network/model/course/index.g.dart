// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesResult _$CoursesResultFromJson(Map<String, dynamic> json) {
  return CoursesResult(
    json['status'] as int,
    json['message'] as String,
    (json['responseObj'] as List)
        ?.map((e) =>
            e == null ? null : Course.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CoursesResultToJson(CoursesResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.results,
    };

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    json['id'] as int,
    json['name'] as String,
    json['color'] as String,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };
