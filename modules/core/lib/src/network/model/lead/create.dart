import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create.g.dart';

@JsonSerializable()
class CreateLead extends Equatable {
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

  const CreateLead(this.surname, this.name, this.middleName, this.cityId, this.phone, this.courseId, this.leadStatusId, this.flexById, this.leadFailureStatusId);

  @override
  List<Object> get props => [surname, name, middleName, cityId, phone, courseId, leadStatusId, flexById, leadFailureStatusId];

  factory CreateLead.fromJson(Map<String, dynamic> json) => _$CreateLeadFromJson(json);

  Map<String, dynamic> toJson() => _$CreateLeadToJson(this);
}
