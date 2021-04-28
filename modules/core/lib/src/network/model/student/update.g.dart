// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStudent _$UpdateStudentFromJson(Map<String, dynamic> json) {
  return UpdateStudent(
    json['id'] as int,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['cityId'] as int,
    json['phone'] as String,
    json['groupId'] as int,
    json['email'] as String,
    json['address'] as String,
    json['hasLaptop'] as bool,
    json['discriminator'] as String,
  );
}

Map<String, dynamic> _$UpdateStudentToJson(UpdateStudent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'cityId': instance.cityId,
      'phone': instance.phone,
      'groupId': instance.groupId,
      'email': instance.email,
      'address': instance.address,
      'hasLaptop': instance.hasLaptop,
      'discriminator': instance.discriminator,
    };
