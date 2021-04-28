// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupsResult _$GroupsResultFromJson(Map<String, dynamic> json) {
  return GroupsResult(
    json['status'] as int,
    json['message'] as String,
    (json['responseObj'] as List)
        ?.map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GroupsResultToJson(GroupsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.results,
    };

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    json['id'] as int,
    json['name'] as String,
    json['cityName'] as String,
    json['months'] as int,
    json['course'] as String,
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cityName': instance.cityName,
      'months': instance.months,
      'course': instance.course,
    };
