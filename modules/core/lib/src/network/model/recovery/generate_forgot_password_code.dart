import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_forgot_password_code.g.dart';

@JsonSerializable()
class GenerateForgotPasswordResult extends Equatable {
  @JsonKey(name: 'code')
  final int code;
  @JsonKey(name: 'email')
  final String email;

  const GenerateForgotPasswordResult(this.code, this.email);

  @override
  List<Object> get props => [code,email];

  factory GenerateForgotPasswordResult.fromJson(Map<String, dynamic> json) => _$GenerateForgotPasswordResultFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateForgotPasswordResultToJson(this);
}

@JsonSerializable()
class GenerateForgotPassword extends Equatable {

  @JsonKey(name: 'email')
  final String email;

  const GenerateForgotPassword(this.email);

  @override
  List<Object> get props => [email];

  factory GenerateForgotPassword.fromJson(Map<String, dynamic> json) => _$GenerateForgotPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateForgotPasswordToJson(this);
}
