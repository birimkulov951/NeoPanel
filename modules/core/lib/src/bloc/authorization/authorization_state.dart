import 'package:equatable/equatable.dart';

import 'package:core/core.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class InitialAuthorization extends AuthorizationState {}

class AuthorizationLoading extends AuthorizationState {
  final String message;

  const AuthorizationLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class AuthorizationHasData extends AuthorizationState {

  final AuthorizationResult authorizationResult;
  final CurrentUserResult userResult;

  const AuthorizationHasData([this.authorizationResult, this.userResult]);

  @override
  List<Object> get props => [authorizationResult, userResult];
}

class AuthorizationNoData extends AuthorizationState {
  final String message;

  const AuthorizationNoData(this.message);

  @override
  List<Object> get props => [message];
}

class AuthorizationNoInternetConnection extends AuthorizationState {
  final String message;

  const AuthorizationNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class AuthorizationError extends AuthorizationState {
  final String errorMessage;

  const AuthorizationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
