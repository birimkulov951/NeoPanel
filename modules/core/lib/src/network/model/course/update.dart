import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update.g.dart';

@JsonSerializable()
class UpdateCourse extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'cityId')
  final int cityId;

  @JsonKey(name: 'teacherId')
  final int teacherId;

  @JsonKey(name: 'color')
  final String color;


  const UpdateCourse(this.id, this.name, this.cityId, this.teacherId, this.color);

  @override
  List<Object> get props => [id, name, cityId, teacherId, color];

  factory UpdateCourse.fromJson(Map<String, dynamic> json) => _$UpdateCourseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCourseToJson(this);
}
