// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupDetailsResult _$GroupDetailsResultFromJson(Map<String, dynamic> json) {
  return GroupDetailsResult(
    json['status'] as int,
    json['message'] as String,
    json['responseObj'] == null
        ? null
        : GroupD.fromJson(json['responseObj'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GroupDetailsResultToJson(GroupDetailsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.group,
    };

GroupD _$GroupDFromJson(Map<String, dynamic> json) {
  return GroupD(
    json['id'] as int,
    json['name'] as String,
    json['course'] as String,
    json['city'] as String,
    json['teacher'] as String,
    json['startDate'] as String,
    json['endDate'] as String,
    json['months'] as int,
    json['contractSum'] as int,
    json['studentCount'] as int,
  );
}

Map<String, dynamic> _$GroupDToJson(GroupD instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'course': instance.course,
      'city': instance.city,
      'teacher': instance.teacher,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'months': instance.months,
      'contractSum': instance.contractSum,
      'studentCount': instance.studentCount,
    };
