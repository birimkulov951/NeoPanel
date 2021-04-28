import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create.g.dart';

@JsonSerializable()
class CreateTeacher extends Equatable {
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

  const CreateTeacher(this.id, this.surname, this.name, this.middleName, this.cityId, this.phone);

  @override
  List<Object> get props => [id, surname, name, middleName, cityId, phone];

  factory CreateTeacher.fromJson(Map<String, dynamic> json) => _$CreateTeacherFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTeacherToJson(this);
}
