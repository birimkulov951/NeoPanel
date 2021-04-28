// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusesResult _$StatusesResultFromJson(Map<String, dynamic> json) {
  return StatusesResult(
    (json['responseObj'] as List)
        ?.map((e) =>
            e == null ? null : Status.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['status'] as int,
    json['message'] as String,
  );
}

Map<String, dynamic> _$StatusesResultToJson(StatusesResult instance) =>
    <String, dynamic>{
      'responseObj': instance.results,
      'status': instance.status,
      'message': instance.message,
    };

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
