import 'package:equatable/equatable.dart';

abstract class PasswordRecoveryEvent extends Equatable {
  final int code;
  final String email;

  const PasswordRecoveryEvent(this.code, this.email);

  @override
  List<Object> get props => [code, email];
}

class GenerateNewPasswordTwo extends PasswordRecoveryEvent {
  GenerateNewPasswordTwo(int code,String email) : super(code, email);
}

class PasswordRecoveryStateChange extends PasswordRecoveryEvent {
  PasswordRecoveryStateChange([int code, String email]) : super(code, email);
}