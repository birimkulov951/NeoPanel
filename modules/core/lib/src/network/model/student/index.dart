import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class StudentsResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final List<Student> results;

  const StudentsResult(this.status, this.message, [this.results = const []]);

  @override
  List<Object> get props => [status, message, results];

  factory StudentsResult.fromJson(Map<String, dynamic> json) => _$StudentsResultFromJson(json);

  Map<String, dynamic> toJson() => _$StudentsResultToJson(this);
}

@JsonSerializable()
class Student extends Equatable {
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

  @JsonKey(name: 'groupName')
  final String groupName;

  @JsonKey(name: 'teacherName')
  final String teacherName;

  @JsonKey(name: 'startDate')
  final String startDate;

  @JsonKey(name: 'endDate')
  final String endDate;

  @JsonKey(name: 'paymentStatus')
  final String paymentStatus;


  Student(this.id, this.surname, this.name, this.middleName, this.cityName, this.groupName, this.teacherName, this.startDate, this.endDate, this.paymentStatus);

  @override
  List<Object> get props => [
    id,
    surname,
    name,
    middleName,
    cityName,
    groupName,
    teacherName,
    startDate,
    endDate,
    paymentStatus
  ];

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}