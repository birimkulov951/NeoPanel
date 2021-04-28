// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResult _$CityResultFromJson(Map<String, dynamic> json) {
  return CityResult(
    json['status'] as int,
    json['message'] as String,
  );
}

Map<String, dynamic> _$CityResultToJson(CityResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
