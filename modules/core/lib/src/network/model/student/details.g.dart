// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentDetailsResult _$StudentDetailsResultFromJson(Map<String, dynamic> json) {
  return StudentDetailsResult(
    json['status'] as int,
    json['message'] as String,
    json['responseObj'] == null
        ? null
        : StudentD.fromJson(json['responseObj'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StudentDetailsResultToJson(
        StudentDetailsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.student,
    };

StudentD _$StudentDFromJson(Map<String, dynamic> json) {
  return StudentD(
    json['id'] as int,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['cityName'] as String,
    json['phone'] as String,
    json['email'] as String,
    json['address'] as String,
    json['hasLaptop'] as bool,
    json['discriminator'] as String,
    (json['groups'] as List)
        ?.map((e) =>
            e == null ? null : GroupSD.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StudentDToJson(StudentD instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'cityName': instance.cityName,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'hasLaptop': instance.hasLaptop,
      'discriminator': instance.discriminator,
      'groups': instance.groups,
    };

GroupSD _$GroupSDFromJson(Map<String, dynamic> json) {
  return GroupSD(
    json['id'] as int,
    json['name'] as String,
    json['cityName'] as String,
    json['months'] as int,
  );
}

Map<String, dynamic> _$GroupSDToJson(GroupSD instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cityName': instance.cityName,
      'months': instance.months,
    };
