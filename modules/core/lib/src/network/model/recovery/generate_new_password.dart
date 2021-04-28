import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_new_password.g.dart';

@JsonSerializable()
class GenerateNewPasswordResult extends Equatable {
  @JsonKey(name: 'code')
  final int code;
  @JsonKey(name: 'email')
  final String email;

  const GenerateNewPasswordResult(this.code, this.email);

  @override
  List<Object> get props => [code,email];

  factory GenerateNewPasswordResult.fromJson(Map<String, dynamic> json) => _$GenerateNewPasswordResultFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateNewPasswordResultToJson(this);
}

@JsonSerializable()
class GenerateNewPassword extends Equatable {

  @JsonKey(name: 'code')
  final int code;
  @JsonKey(name: 'email')
  final String email;

  GenerateNewPassword(this.code,this.email);

  @override
  List<Object> get props => [code,email];

  factory GenerateNewPassword.fromJson(Map<String, dynamic> json) => _$GenerateNewPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateNewPasswordToJson(this);
}
