// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadsResult _$LeadsResultFromJson(Map<String, dynamic> json) {
  return LeadsResult(
    json['status'] as int,
    json['message'] as String,
    (json['responseObj'] as List)
        ?.map(
            (e) => e == null ? null : Lead.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LeadsResultToJson(LeadsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.results,
    };

Lead _$LeadFromJson(Map<String, dynamic> json) {
  return Lead(
    json['id'] as int,
    json['surname'] as String,
    json['name'] as String,
    json['phone'] as String,
    json['cityName'] as String,
    json['courseName'] as String,
    json['leadStatus'] as String,
  );
}

Map<String, dynamic> _$LeadToJson(Lead instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'phone': instance.phone,
      'cityName': instance.cityName,
      'courseName': instance.courseName,
      'leadStatus': instance.leadStatus,
    };
