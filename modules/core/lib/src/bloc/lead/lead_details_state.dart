import 'package:core/core.dart';

import 'package:equatable/equatable.dart';

abstract class LeadDetailsState extends Equatable {
  const LeadDetailsState();

  @override
  List<Object> get props => [];
}

class InitialLeadDetails extends LeadDetailsState {}

class LeadDetailsLoading extends LeadDetailsState {}

class LeadDetailsHasData extends LeadDetailsState {

  final LeadDetailsResult leadDetailsResult;

  const LeadDetailsHasData([this.leadDetailsResult]);

  @override
  List<Object> get props => [leadDetailsResult];
}

class LeadDetailsNoData extends LeadDetailsState {
  final String message;

  const LeadDetailsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class LeadDetailsNoInternetConnection extends LeadDetailsState {}

class LeadDetailsError extends LeadDetailsState {
  final String errorMessage;

  const LeadDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}



class LeadStatusChangeLoadingTwo extends LeadDetailsState {}

class LeadStatusChangeHasDataTwo extends LeadDetailsState {

  final Result result;

  const LeadStatusChangeHasDataTwo([this.result]);

  @override
  List<Object> get props => [result];
}

class LeadStatusChangeNoDataTwo extends LeadDetailsState {
  final String message;

  const LeadStatusChangeNoDataTwo(this.message);

  @override
  List<Object> get props => [message];
}

class LeadStatusChangeErrorTwo extends LeadDetailsState {
  final String errorMessage;

  const LeadStatusChangeErrorTwo(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}



class LeadStatusesLoading extends LeadDetailsState {}

class LeadStatusesHasData extends LeadDetailsState {

  final StatusesResult leadStatuses;

  const LeadStatusesHasData([this.leadStatuses]);

  @override
  List<Object> get props => [leadStatuses];
}

class LeadStatusesNoData extends LeadDetailsState {
  final String message;

  const LeadStatusesNoData(this.message);

  @override
  List<Object> get props => [message];
}

class LeadStatusesError extends LeadDetailsState {
  final String errorMessage;

  const LeadStatusesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}