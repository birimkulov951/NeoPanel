import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update.g.dart';

@JsonSerializable()
class UpdateTeacher extends Equatable {
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

  const UpdateTeacher(this.id, this.surname, this.name, this.middleName, this.cityId, this.phone);

  @override
  List<Object> get props => [id, surname, name, middleName, cityId, phone];

  factory UpdateTeacher.fromJson(Map<String, dynamic> json) => _$UpdateTeacherFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTeacherToJson(this);
}
