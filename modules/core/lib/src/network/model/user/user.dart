import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class CurrentUserResult extends Equatable {

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

  @JsonKey(name: 'cityName')
  final String cityName;

  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'roles')
  final List<String> roles;

  CurrentUserResult(this.id, this.username, this.surname, this.name, this.middleName, this.cityName, this.phoneNumber, this.email, [this.roles = const []]);

  @override
  List<Object> get props => [id, username, surname, name, middleName, cityName, phoneNumber, email, roles];

  factory CurrentUserResult.fromJson(Map<String, dynamic> json) => _$CurrentUserResultFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserResultToJson(this);
}
