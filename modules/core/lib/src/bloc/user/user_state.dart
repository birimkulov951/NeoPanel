import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class InitialUser extends UserState {}

class UserLoading extends UserState {
  final String message;

  const UserLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class UserHasData extends UserState {

  final UsersResult usersResult;

  const UserHasData([this.usersResult]);

  @override
  List<Object> get props => [usersResult];
}

class UserNoData extends UserState {
  final String message;

  const UserNoData(this.message);

  @override
  List<Object> get props => [message];
}

class UserNoInternetConnection extends UserState {
  final String message;

  const UserNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class UserError extends UserState {
  final String errorMessage;

  const UserError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


