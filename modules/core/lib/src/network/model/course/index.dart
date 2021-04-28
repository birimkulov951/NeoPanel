import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class CoursesResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final List<Course> results;

  const CoursesResult(this.status, this.message, [this.results = const []]);

  @override
  List<Object> get props => [status, message, results];

  factory CoursesResult.fromJson(Map<String, dynamic> json) => _$CoursesResultFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesResultToJson(this);
}

@JsonSerializable()
class Course extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'color')
  final String color;


  Course(this.id, this.name, this.color);

  @override
  List<Object> get props => [
    id,
    name,
    color
  ];

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}