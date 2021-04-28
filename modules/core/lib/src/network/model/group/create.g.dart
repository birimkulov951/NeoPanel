// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGroup _$CreateGroupFromJson(Map<String, dynamic> json) {
  return CreateGroup(
    json['name'] as String,
    json['courseId'] as int,
    json['startDate'] as String,
    json['endDate'] as String,
  );
}

Map<String, dynamic> _$CreateGroupToJson(CreateGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'courseId': instance.courseId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
