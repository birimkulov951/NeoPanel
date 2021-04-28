// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLead _$CreateLeadFromJson(Map<String, dynamic> json) {
  return CreateLead(
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['cityId'] as int,
    json['phone'] as String,
    json['courseId'] as int,
    json['leadStatusId'] as int,
    json['flexById'] as String,
    json['leadFailureStatusId'] as int,
  );
}

Map<String, dynamic> _$CreateLeadToJson(CreateLead instance) =>
    <String, dynamic>{
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'cityId': instance.cityId,
      'phone': instance.phone,
      'courseId': instance.courseId,
      'leadStatusId': instance.leadStatusId,
      'flexById': instance.flexById,
      'leadFailureStatusId': instance.leadFailureStatusId,
    };
