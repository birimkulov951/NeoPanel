// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeachersResult _$TeachersResultFromJson(Map<String, dynamic> json) {
  return TeachersResult(
    json['status'] as int,
    json['message'] as String,
    (json['responseObj'] as List)
        ?.map((e) =>
            e == null ? null : Teacher.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TeachersResultToJson(TeachersResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.results,
    };

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    json['id'] as int,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['course'] as String,
  );
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'course': instance.course,
    };
