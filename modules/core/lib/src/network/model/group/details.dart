import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class GroupDetailsResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final GroupD group;

  const GroupDetailsResult(this.status, this.message, this.group);

  @override
  List<Object> get props => [status, message, group];

  factory GroupDetailsResult.fromJson(Map<String, dynamic> json) => _$GroupDetailsResultFromJson(json);

  Map<String, dynamic> toJson() => _$GroupDetailsResultToJson(this);
}

@JsonSerializable()
class GroupD extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'course')
  final String course;

  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'teacher')
  final String teacher;

  @JsonKey(name: 'startDate')
  final String startDate;

  @JsonKey(name: 'endDate')
  final String endDate;

  @JsonKey(name: 'months')
  final int months;

  @JsonKey(name: 'contractSum')
  final int contractSum;

  @JsonKey(name: 'studentCount')
  final int studentCount;

  GroupD(this.id, this.name, this.course, this.city, this.teacher, this.startDate, this.endDate, this.months, this.contractSum, this.studentCount);

  @override
  List<Object> get props => [id, name, course, city, teacher, startDate, endDate, months, contractSum, studentCount];

  factory GroupD.fromJson(Map<String, dynamic> json) => _$GroupDFromJson(json);

  Map<String, dynamic> toJson() => _$GroupDToJson(this);
}