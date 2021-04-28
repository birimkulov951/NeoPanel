import 'package:equatable/equatable.dart';
import 'package:core/core.dart';

abstract class GroupState extends Equatable {
  const GroupState();

  @override
  List<Object> get props => [];
}

class InitialGroup extends GroupState {}

class GroupLoading extends GroupState {
  final String message;

  const GroupLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class CoursesAndGroupsHasData extends GroupState {

  final CoursesResult coursesResult;

  final GroupsResult groupsResult;

  const CoursesAndGroupsHasData([this.coursesResult, this.groupsResult]);

  @override
  List<Object> get props => [coursesResult, groupsResult];
}

class CoursesNoData extends GroupState {
  final String message;

  const CoursesNoData(this.message);

  @override
  List<Object> get props => [message];
}

class GroupsNoData extends GroupState {
  final String message;

  const GroupsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class GroupNoInternetConnection extends GroupState {
  final String message;

  const GroupNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class GroupError extends GroupState {
  final String errorMessage;

  const GroupError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


