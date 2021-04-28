import 'package:equatable/equatable.dart';

abstract class AuthorizationEvent extends Equatable {
  final String email;
  final String password;
  final bool isRememberMe;

  const AuthorizationEvent(this.email, this.password, this.isRememberMe);

  @override
  List<Object> get props => [email,password,isRememberMe];
}

class AuthorizationAuthorize extends AuthorizationEvent {
  AuthorizationAuthorize(String email, String password, bool isRememberMe) : super(email, password, isRememberMe);
}

class AuthorizationStateChange extends AuthorizationEvent {
  AuthorizationStateChange([String email, String password, bool isRememberMe]) : super(email, password, isRememberMe);
}
