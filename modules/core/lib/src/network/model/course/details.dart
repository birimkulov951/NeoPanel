import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class CourseDetailsResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final CourseD lead;

  const CourseDetailsResult(this.status, this.message, this.lead);

  @override
  List<Object> get props => [status, message, lead];

  factory CourseDetailsResult.fromJson(Map<String, dynamic> json) => _$CourseDetailsResultFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailsResultToJson(this);
}

@JsonSerializable()
class CourseD extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'teacher')
  final String teacher;

  @JsonKey(name: 'color')
  final String color;

  CourseD(this.id, this.name, this.teacher, this.color);

  @override
  List<Object> get props => [
    id,
    name,
    teacher,
    color
  ];

  factory CourseD.fromJson(Map<String, dynamic> json) => _$CourseDFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDToJson(this);
}