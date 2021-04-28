import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class StudentDetailsResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final StudentD student;

  const StudentDetailsResult(this.status, this.message, this.student);

  @override
  List<Object> get props => [status, message, student];

  factory StudentDetailsResult.fromJson(Map<String, dynamic> json) => _$StudentDetailsResultFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDetailsResultToJson(this);
}

@JsonSerializable()
class StudentD extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'surname')
  final String surname;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'middleName')
  final String middleName;

  @JsonKey(name: 'cityName')
  final String cityName;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'hasLaptop')
  final bool hasLaptop;

  @JsonKey(name: 'discriminator')
  final String discriminator;

  @JsonKey(name: 'groups')
  final List<GroupSD> groups;

  StudentD(this.id, this.surname, this.name, this.middleName, this.cityName, this.phone, this.email, this.address, this.hasLaptop, this.discriminator, [this.groups = const []]);

  @override
  List<Object> get props => [
    id,
    surname,
    name,
    middleName,
    cityName,
    phone,
    email,
    address,
    hasLaptop,
    discriminator
  ];

  factory StudentD.fromJson(Map<String, dynamic> json) => _$StudentDFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDToJson(this);
}

@JsonSerializable()
class GroupSD extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'cityName')
  final String cityName;

  @JsonKey(name: 'months')
  final int months;

  GroupSD(this.id, this.name, this.cityName, this.months);

  @override
  List<Object> get props => [
    id,
    name,
    cityName,
    months
  ];

  factory GroupSD.fromJson(Map<String, dynamic> json) => _$GroupSDFromJson(json);

  Map<String, dynamic> toJson() => _$GroupSDToJson(this);
}