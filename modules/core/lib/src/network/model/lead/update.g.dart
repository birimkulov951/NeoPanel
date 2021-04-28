// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLead _$UpdateLeadFromJson(Map<String, dynamic> json) {
  return UpdateLead(
    json['id'] as int,
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

Map<String, dynamic> _$UpdateLeadToJson(UpdateLead instance) =>
    <String, dynamic>{
      'id': instance.id,
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
