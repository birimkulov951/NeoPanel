import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update.g.dart';

@JsonSerializable()
class UpdateLead extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'surname')
  final String surname;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'middleName')
  final String middleName;

  @JsonKey(name: 'cityId')
  final int cityId;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'courseId')
  final int courseId;

  @JsonKey(name: 'leadStatusId')
  final int leadStatusId;

  @JsonKey(name: 'flexById')
  final String flexById;

  @JsonKey(name: 'leadFailureStatusId')
  final int leadFailureStatusId;

  const UpdateLead(this.id, this.surname, this.name, this.middleName, this.cityId, this.phone, this.courseId, this.leadStatusId, this.flexById, this.leadFailureStatusId);

  @override
  List<Object> get props => [id, surname, name, middleName, cityId, phone, courseId, leadStatusId, flexById, leadFailureStatusId];

  factory UpdateLead.fromJson(Map<String, dynamic> json) => _$UpdateLeadFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateLeadToJson(this);
}
