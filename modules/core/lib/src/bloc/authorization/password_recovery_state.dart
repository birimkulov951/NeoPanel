import 'package:equatable/equatable.dart';

import 'package:core/core.dart';

abstract class PasswordRecoveryState extends Equatable {
  const PasswordRecoveryState();

  @override
  List<Object> get props => [];
}

class InitialPasswordRecovery extends PasswordRecoveryState {}

class PasswordRecoveryLoading extends PasswordRecoveryState {}

class PasswordRecoveryForgotPasswordHasData extends PasswordRecoveryState {

  final GenerateForgotPasswordResult generateForgotPasswordResult;

  const PasswordRecoveryForgotPasswordHasData([this.generateForgotPasswordResult]);

  @override
  List<Object> get props => [generateForgotPasswordResult];
}

class PasswordRecoveryNewPasswordHasData extends PasswordRecoveryState {

  final PasswordRecoveryNewPasswordHasData generateNewPasswordResult;

  const PasswordRecoveryNewPasswordHasData([this.generateNewPasswordResult]);

  @override
  List<Object> get props => [generateNewPasswordResult];
}

class PasswordRecoveryNoData extends PasswordRecoveryState {
  final String message;

  const PasswordRecoveryNoData(this.message);

  @override
  List<Object> get props => [message];
}

class PasswordRecoveryNoInternetConnection extends PasswordRecoveryState {}

class PasswordRecoveryError extends PasswordRecoveryState {
  final String errorMessage;

  const PasswordRecoveryError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
