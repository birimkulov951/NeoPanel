import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class GroupsResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final List<Group> results;

  const GroupsResult(this.status, this.message, [this.results = const []]);

  @override
  List<Object> get props => [status, message, results];

  factory GroupsResult.fromJson(Map<String, dynamic> json) => _$GroupsResultFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsResultToJson(this);
}

@JsonSerializable()
class Group extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'cityName')
  final String cityName;

  @JsonKey(name: 'months')
  final int months;

  @JsonKey(name: 'course')
  final String course;

  Group(this.id, this.name, this.cityName, this.months, this.course);

  @override
  List<Object> get props => [
    id,
    name,
    cityName,
    months,
    course
  ];

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}