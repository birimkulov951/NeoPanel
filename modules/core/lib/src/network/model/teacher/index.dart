import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class TeachersResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final List<Teacher> results;

  const TeachersResult(this.status, this.message, [this.results = const []]);

  @override
  List<Object> get props => [status, message, results];

  factory TeachersResult.fromJson(Map<String, dynamic> json) => _$TeachersResultFromJson(json);

  Map<String, dynamic> toJson() => _$TeachersResultToJson(this);
}

@JsonSerializable()
class Teacher extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'surname')
  final String surname;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'middleName')
  final String middleName;

  @JsonKey(name: 'course')
  final String course;

  Teacher(this.id, this.surname, this.name, this.middleName, this.course);

  @override
  List<Object> get props => [id, surname, name, middleName, course];

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}