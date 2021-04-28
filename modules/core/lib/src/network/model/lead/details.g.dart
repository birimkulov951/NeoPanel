// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadDetailsResult _$LeadDetailsResultFromJson(Map<String, dynamic> json) {
  return LeadDetailsResult(
    json['status'] as int,
    json['message'] as String,
    json['responseObj'] == null
        ? null
        : LeadD.fromJson(json['responseObj'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LeadDetailsResultToJson(LeadDetailsResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'responseObj': instance.lead,
    };

LeadD _$LeadDFromJson(Map<String, dynamic> json) {
  return LeadD(
    json['id'] as int,
    json['surname'] as String,
    json['name'] as String,
    json['middleName'] as String,
    json['cityName'] as String,
    json['phone'] as String,
    json['courseName'] as String,
    json['leadStatus'] as String,
    json['flexById'] as String,
    json['leadFailureStatusId'] as int,
    (json['leadFleadCommentsailureStatusId'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LeadDToJson(LeadD instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'middleName': instance.middleName,
      'cityName': instance.cityName,
      'phone': instance.phone,
      'courseName': instance.courseName,
      'leadStatus': instance.leadStatus,
      'flexById': instance.flexById,
      'leadFailureStatusId': instance.leadFailureStatusId,
      'leadFleadCommentsailureStatusId': instance.leadComments,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    json['id'] as int,
    json['userName'] as String,
    json['commentDateTime'] as String,
    json['comment'] as String,
    json['leadId'] as int,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'commentDateTime': instance.commentDateTime,
      'comment': instance.comment,
      'leadId': instance.leadId,
    };
