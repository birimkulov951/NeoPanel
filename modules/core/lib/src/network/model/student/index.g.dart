// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentsResult _$StudentsResultFromJson(Map<String, dynamic> json) {
  return StudentsResult(
    json['status'] as int,
    json['message'] as String,
    (json['responseObj'] as List)
        ?.map((e) =>
            e == null ? null : Student.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StudentsResultToJson(StudentsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.results,
    };

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    json['id'] as int,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['cityName'] as String,
    json['groupName'] as String,
    json['teacherName'] as String,
    json['startDate'] as String,
    json['endDate'] as String,
    json['paymentStatus'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'cityName': instance.cityName,
      'groupName': instance.groupName,
      'teacherName': instance.teacherName,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'paymentStatus': instance.paymentStatus,
    };
