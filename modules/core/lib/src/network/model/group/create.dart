import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create.g.dart';

@JsonSerializable()
class CreateGroup extends Equatable {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'courseId')
  final int courseId;

  @JsonKey(name: 'startDate')
  final String startDate;

  @JsonKey(name: 'endDate')
  final String endDate;

  const CreateGroup(this.name, this.courseId, this.startDate, this.endDate);

  @override
  List<Object> get props => [name, courseId, startDate, endDate];

  factory CreateGroup.fromJson(Map<String, dynamic> json) => _$CreateGroupFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGroupToJson(this);
}
