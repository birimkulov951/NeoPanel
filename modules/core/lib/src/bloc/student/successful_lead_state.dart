import 'package:core/core.dart';

import 'package:equatable/equatable.dart';

abstract class SuccessfulLeadState extends Equatable {
  const SuccessfulLeadState();

  @override
  List<Object> get props => [];
}

class InitialSuccessfulLead extends SuccessfulLeadState {}

class SuccessfulLeadLoading extends SuccessfulLeadState {
  final String message;

  const SuccessfulLeadLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class SuccessfulLeadHasData extends SuccessfulLeadState {
  final Result result;

  const SuccessfulLeadHasData([this.result]);

  @override
  List<Object> get props => [result];
}

class SuccessfulLeadNoData extends SuccessfulLeadState {
  final String message;

  const SuccessfulLeadNoData(this.message);

  @override
  List<Object> get props => [message];
}

class SuccessfulLeadNoInternetConnection extends SuccessfulLeadState {
  final String message;

  const SuccessfulLeadNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class SuccessfulLeadError extends SuccessfulLeadState {
  final String errorMessage;

  const SuccessfulLeadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoadCoursesAndGroupsLoading extends SuccessfulLeadState {
  final String message;

  const LoadCoursesAndGroupsLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class LoadCoursesAndGroupsHasData extends SuccessfulLeadState {
  final CoursesResult coursesResult;
  final GroupsResult groupsResult;

  const LoadCoursesAndGroupsHasData([this.coursesResult, this.groupsResult]);

  @override
  List<Object> get props => [coursesResult, groupsResult];
}

class LoadCoursesAndGroupsNoData extends SuccessfulLeadState {
  final String message;

  const LoadCoursesAndGroupsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class LoadCoursesAndGroupsError extends SuccessfulLeadState {
  final String errorMessage;

  const LoadCoursesAndGroupsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


class GroupDetailsLoadingTwo extends SuccessfulLeadState {
  final String message;

  const GroupDetailsLoadingTwo([this.message]);

  @override
  List<Object> get props => [message];
}

class GroupDetailsHasDataTwo extends SuccessfulLeadState {
  final GroupDetailsResult groupDetailsResult;

  const GroupDetailsHasDataTwo([this.groupDetailsResult]);

  @override
  List<Object> get props => [groupDetailsResult];
}

class GroupDetailsNoDataTwo extends SuccessfulLeadState {
  final String message;

  const GroupDetailsNoDataTwo(this.message);

  @override
  List<Object> get props => [message];
}

class GroupDetailsErrorTwo extends SuccessfulLeadState {
  final String errorMessage;

  const GroupDetailsErrorTwo(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
