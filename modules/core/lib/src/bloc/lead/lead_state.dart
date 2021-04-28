import 'package:core/core.dart';

import 'package:equatable/equatable.dart';

abstract class LeadsState extends Equatable {
  const LeadsState();

  @override
  List<Object> get props => [];
}

class InitialLeadsState extends LeadsState {}

class LeadsLoading extends LeadsState {
  final String message;

  const LeadsLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class LeadsHasData extends LeadsState {
  final StatusesResult statusesResult;
  final LeadsResult leadsResult;

  const LeadsHasData([this.statusesResult, this.leadsResult]);

  @override
  List<Object> get props => [statusesResult,leadsResult];
}

class LeadsNoData extends LeadsState {
  final String message;

  const LeadsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class LeadsNoInternetConnection extends LeadsState {
  final String message;

  const LeadsNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class LeadsError extends LeadsState {
  final String errorMessage;

  const LeadsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}





class LeadStatusChangeLoading extends LeadsState {
  final String message;

  const LeadStatusChangeLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class LeadStatusChangeHasData extends LeadsState {

  final Result result;

  const LeadStatusChangeHasData([this.result]);

  @override
  List<Object> get props => [result];
}

class LeadStatusChangeNoData extends LeadsState {
  final String message;

  const LeadStatusChangeNoData(this.message);

  @override
  List<Object> get props => [message];
}

class LeadStatusChangeNoInternetConnection extends LeadsState {
  final String message;

  const LeadStatusChangeNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class LeadStatusChangeError extends LeadsState {
  final String errorMessage;

  const LeadStatusChangeError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}



class LoadLeadsFromDioHasData extends LeadsState {
  final StatusesResult statusesResult;
  final LeadsResult leadsResult;

  const LoadLeadsFromDioHasData([this.statusesResult, this.leadsResult]);

  @override
  List<Object> get props => [statusesResult,leadsResult];
}

class LoadLeadsFromDioNoData extends LeadsState {
  final String message;

  const LoadLeadsFromDioNoData(this.message);

  @override
  List<Object> get props => [message];
}

class LoadLeadsFromDioError extends LeadsState {
  final String errorMessage;

  const LoadLeadsFromDioError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}