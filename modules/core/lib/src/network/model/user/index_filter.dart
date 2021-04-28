import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index_filter.g.dart';

@JsonSerializable()
class UsersFilterResult extends Equatable {
  @JsonKey(name: 'totalRecords')
  final int totalRecords;

  @JsonKey(name: 'data')
  final List<User> results;

  UsersFilterResult(this.totalRecords, [this.results = const []]);

  @override
  List<Object> get props => [totalRecords, results];

  factory UsersFilterResult.fromJson(Map<String, dynamic> json) =>
      _$UsersFilterResultFromJson(json);

  Map<String, dynamic> toJson() => _$UsersFilterResultToJson(this);
}

@JsonSerializable()
class User extends Equatable {
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

  User(this.id, this.username, this.surname, this.name, this.middleName,
      this.cityName, this.phoneNumber, this.email,
      [this.roles = const []]);

  @override
  List<Object> get props => [
        id,
        username,
        surname,
        name,
        middleName,
        cityName,
        phoneNumber,
        email,
        roles
      ];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
