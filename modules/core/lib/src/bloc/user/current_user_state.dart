import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

abstract class CurrentUserState extends Equatable {
  const CurrentUserState();

  @override
  List<Object> get props => [];
}

class InitialCurrentUser extends CurrentUserState {}


class CurrentUserHasData extends CurrentUserState {

  final CurrentUserResult currentUserResult;

  const CurrentUserHasData([this.currentUserResult]);

  @override
  List<Object> get props => [currentUserResult];
}


class CurrentUserNoInternetConnection extends CurrentUserState {
  final String message;

  const CurrentUserNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class CurrentUserError extends CurrentUserState {
  final String errorMessage;

  const CurrentUserError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


class UpdateUserLoading extends CurrentUserState {
  final String message;

  const UpdateUserLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class UpdateUserHasData extends CurrentUserState {

  final AuthorizationResult authorizationResult;

  const UpdateUserHasData([this.authorizationResult]);

  @override
  List<Object> get props => [authorizationResult];
}

class UpdateUserNoData extends CurrentUserState {
  final String message;

  const UpdateUserNoData(this.message);

  @override
  List<Object> get props => [message];
}

class UpdateUserNoInternetConnection extends CurrentUserState {
  final String message;

  const UpdateUserNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class UpdateUserError extends CurrentUserState {
  final String errorMessage;

  const UpdateUserError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}




class CitiesForMyProfileLoading extends CurrentUserState {
  final String errorMessage;

  const CitiesForMyProfileLoading([this.errorMessage]);

  @override
  List<Object> get props => [errorMessage];
}

class CitiesForMyProfileHasData extends CurrentUserState {

  final CitiesResult citiesResult;

  const CitiesForMyProfileHasData([this.citiesResult]);

  @override
  List<Object> get props => [citiesResult];
}

class CitiesForMyProfileError extends CurrentUserState {
  final String errorMessage;

  const CitiesForMyProfileError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

