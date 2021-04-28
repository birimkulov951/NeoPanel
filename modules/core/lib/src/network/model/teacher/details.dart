import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class TeacherDetailsResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final TeacherD teacher;

  const TeacherDetailsResult(this.status, this.message, this.teacher);

  @override
  List<Object> get props => [status, message, teacher];

  factory TeacherDetailsResult.fromJson(Map<String, dynamic> json) => _$TeacherDetailsResultFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherDetailsResultToJson(this);
}

@JsonSerializable()
class TeacherD extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'surname')
  final String surname;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'middleName')
  final String middleName;

  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'course')
  final String course;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'patent')
  final String patent;

  @JsonKey(name: 'patentStartDate')
  final String patentStartDate;

  @JsonKey(name: 'patentEndDate')
  final String patentEndDate;

  TeacherD(this.id, this.surname, this.name, this.middleName, this.city, this.course, this.phone, this.patent, this.patentStartDate, this.patentEndDate);

  @override
  List<Object> get props => [id, surname, name, middleName, city, course, phone, patent, patentStartDate, patentEndDate];

  factory TeacherD.fromJson(Map<String, dynamic> json) => _$TeacherDFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherDToJson(this);
}