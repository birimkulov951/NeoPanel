import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

abstract class FailureLeadState extends Equatable {
  const FailureLeadState();

  @override
  List<Object> get props => [];
}

class InitialFailureLead extends FailureLeadState {}

class FailureLeadLoading extends FailureLeadState {
  final String message;

  const FailureLeadLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class FailureLeadHasData extends FailureLeadState {
  final Result result;

  const FailureLeadHasData([this.result]);

  @override
  List<Object> get props => [result];
}

class FailureLeadNoData extends FailureLeadState {
  final String message;

  const FailureLeadNoData(this.message);

  @override
  List<Object> get props => [message];
}

class FailureLeadNoInternetConnection extends FailureLeadState {
  final String message;

  const FailureLeadNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class FailureLeadError extends FailureLeadState {
  final String errorMessage;

  const FailureLeadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
