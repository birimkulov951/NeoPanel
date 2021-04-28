import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update.g.dart';

@JsonSerializable()
class UpdateGroup extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'cityId')
  final int cityId;

  @JsonKey(name: 'startDate')
  final String startDate;

  @JsonKey(name: 'endDate')
  final String endDate;

  const UpdateGroup(this.id, this.name, this.cityId, this.startDate, this.endDate);

  @override
  List<Object> get props => [id, name, cityId, startDate, endDate];

  factory UpdateGroup.fromJson(Map<String, dynamic> json) => _$UpdateGroupFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateGroupToJson(this);
}
