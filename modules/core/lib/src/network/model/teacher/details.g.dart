// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherDetailsResult _$TeacherDetailsResultFromJson(Map<String, dynamic> json) {
  return TeacherDetailsResult(
    json['status'] as int,
    json['message'] as String,
    json['responseObj'] == null
        ? null
        : TeacherD.fromJson(json['responseObj'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TeacherDetailsResultToJson(
        TeacherDetailsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.teacher,
    };

TeacherD _$TeacherDFromJson(Map<String, dynamic> json) {
  return TeacherD(
    json['id'] as int,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['city'] as String,
    json['course'] as String,
    json['phone'] as String,
    json['patent'] as String,
    json['patentStartDate'] as String,
    json['patentEndDate'] as String,
  );
}

Map<String, dynamic> _$TeacherDToJson(TeacherD instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'city': instance.city,
      'course': instance.course,
      'phone': instance.phone,
      'patent': instance.patent,
      'patentStartDate': instance.patentStartDate,
      'patentEndDate': instance.patentEndDate,
    };
