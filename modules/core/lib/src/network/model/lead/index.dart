import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class LeadsResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final List<Lead> results;

  const LeadsResult(this.status, this.message, [this.results = const []]);

  @override
  List<Object> get props => [status, message, results];

  factory LeadsResult.fromJson(Map<String, dynamic> json) => _$LeadsResultFromJson(json);

  Map<String, dynamic> toJson() => _$LeadsResultToJson(this);
}

@JsonSerializable()
class Lead extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'surname')
  final String surname;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'cityName')
  final String cityName;

  @JsonKey(name: 'courseName')
  final String courseName;

  @JsonKey(name: 'leadStatus')
  final String leadStatus;

  Lead(this.id, this.surname, this.name, this.phone, this.cityName, this.courseName, this.leadStatus);

  @override
  List<Object> get props => [
    id,
    surname,
    name,
    phone,
    cityName,
    courseName,
    leadStatus
  ];

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);

  Map<String, dynamic> toJson() => _$LeadToJson(this);
}