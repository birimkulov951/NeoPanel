import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class LeadDetailsResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final LeadD lead;

  const LeadDetailsResult(this.status, this.message, this.lead);

  @override
  List<Object> get props => [status, message, lead];

  factory LeadDetailsResult.fromJson(Map<String, dynamic> json) => _$LeadDetailsResultFromJson(json);

  Map<String, dynamic> toJson() => _$LeadDetailsResultToJson(this);
}

@JsonSerializable()
class LeadD extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'surname')
  final String surname;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'middleName')
  final String middleName;

  @JsonKey(name: 'cityName')
  final String cityName;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'courseName')
  final String courseName;

  @JsonKey(name: 'leadStatus')
  final String leadStatus;

  @JsonKey(name: 'flexById')
  final String flexById;

  @JsonKey(name: 'leadFailureStatusId')
  final int leadFailureStatusId;

  @JsonKey(name: 'leadFleadCommentsailureStatusId')
  final List<Comment> leadComments;


  LeadD(this.id, this.surname, this.name, this.middleName, this.cityName, this.phone, this.courseName, this.leadStatus, this.flexById, this.leadFailureStatusId, this.leadComments);

  @override
  List<Object> get props => [
    id,
    surname,
    name,
    middleName,
    cityName,
    phone,
    courseName,
    leadStatus,
    flexById,
    leadFailureStatusId,
    leadComments
  ];

  factory LeadD.fromJson(Map<String, dynamic> json) => _$LeadDFromJson(json);

  Map<String, dynamic> toJson() => _$LeadDToJson(this);
}

@JsonSerializable()
class Comment extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'userName')
  final String userName;

  @JsonKey(name: 'commentDateTime')
  final String commentDateTime;

  @JsonKey(name: 'comment')
  final String comment;

  @JsonKey(name: 'leadId')
  final int leadId;


  Comment(this.id, this.userName, this.commentDateTime, this.comment, this.leadId);

  @override
  List<Object> get props => [
    id,
    userName,
    commentDateTime,
    leadId
  ];

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}