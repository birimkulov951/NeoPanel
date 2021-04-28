import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update.g.dart';

@JsonSerializable()
class UpdateCurrentUser extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'surname')
  final String surname;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'middleName')
  final String middleName;

  @JsonKey(name: 'cityId')
  final int cityId;

  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;

  @JsonKey(name: 'email')
  final String email;

  const UpdateCurrentUser(this.id, this.username, this.surname, this.name, this.middleName, this.cityId, this.phoneNumber, this.email);

  @override
  List<Object> get props => [id, username, surname, name, middleName, cityId, phoneNumber, email];

  factory UpdateCurrentUser.fromJson(Map<String, dynamic> json) => _$UpdateCurrentUserFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCurrentUserToJson(this);
}
