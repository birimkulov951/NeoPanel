// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResult _$CitiesResultFromJson(Map<String, dynamic> json) {
  return CitiesResult(
    json['status'] as int,
    json['message'] as String,
    (json['responseObj'] as List)
        ?.map(
            (e) => e == null ? null : City.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CitiesResultToJson(CitiesResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.results,
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    json['id'] as int,
    json['name'] as String,
    json['createDate'] as String,
    json['groupsCount'] as int,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': instance.createDate,
      'groupsCount': instance.groupsCount,
    };
