// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateGroup _$UpdateGroupFromJson(Map<String, dynamic> json) {
  return UpdateGroup(
    json['id'] as int,
    json['name'] as String,
    json['cityId'] as int,
    json['startDate'] as String,
    json['endDate'] as String,
  );
}

Map<String, dynamic> _$UpdateGroupToJson(UpdateGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cityId': instance.cityId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
