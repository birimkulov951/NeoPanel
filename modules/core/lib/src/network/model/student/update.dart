import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update.g.dart';

@JsonSerializable()
class UpdateStudent extends Equatable {
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

  @JsonKey(name: 'groupId')
  final int groupId;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'hasLaptop')
  final bool hasLaptop;

  @JsonKey(name: 'discriminator')
  final String discriminator;


  UpdateStudent(this.id, this.surname, this.name, this.middleName, this.cityId, this.phone, this.groupId, this.email, this.address, this.hasLaptop, this.discriminator);

  @override
  List<Object> get props => [id, surname, name, middleName, cityId, phone, groupId, email, address, hasLaptop, discriminator];

  factory UpdateStudent.fromJson(Map<String, dynamic> json) => _$UpdateStudentFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateStudentToJson(this);
}
