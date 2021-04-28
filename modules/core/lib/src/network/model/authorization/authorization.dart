import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authorization.g.dart';

@JsonSerializable()
class AuthorizationResult extends Equatable {
  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'expiration')
  final String expiration;

  const AuthorizationResult(this.token, this.expiration);

  @override
  List<Object> get props => [token,expiration];

  factory AuthorizationResult.fromJson(Map<String, dynamic> json) => _$AuthorizationResultFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationResultToJson(this);
}

@JsonSerializable()
class Authorization extends Equatable {

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  Authorization(
      this.email,
      this.password,
      );

  @override
  List<Object> get props => [
    email,
    password
  ];

  factory Authorization.fromJson(Map<String, dynamic> json) => _$AuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);
}
