import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create.g.dart';

@JsonSerializable()
class CreateCourse extends Equatable {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'cityId')
  final int cityId;

  @JsonKey(name: 'teacherId')
  final int teacherId;

  @JsonKey(name: 'color')
  final String color;

  const CreateCourse(this.name, this.cityId, this.teacherId, this.color);

  @override
  List<Object> get props => [name, cityId, teacherId, color];

  factory CreateCourse.fromJson(Map<String, dynamic> json) => _$CreateCourseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCourseToJson(this);
}
