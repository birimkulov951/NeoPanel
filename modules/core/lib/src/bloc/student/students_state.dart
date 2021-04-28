import 'package:core/core.dart';

import 'package:equatable/equatable.dart';

abstract class StudentsState extends Equatable {
  const StudentsState();

  @override
  List<Object> get props => [];
}

class InitialStudents extends StudentsState {}

class StudentsLoading extends StudentsState {
  final String message;

  const StudentsLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class StudentsHasData extends StudentsState {
  final StudentsResult studentsResult;

  const StudentsHasData([this.studentsResult]);

  @override
  List<Object> get props => [studentsResult];
}

class StudentsNoData extends StudentsState {
  final String message;

  const StudentsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class StudentsNoInternetConnection extends StudentsState {
  final String message;

  const StudentsNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class StudentsError extends StudentsState {
  final String errorMessage;

  const StudentsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class GroupDetailsHasData extends StudentsState {
  final GroupDetailsResult groupDetailsResult;

  const GroupDetailsHasData([this.groupDetailsResult]);

  @override
  List<Object> get props => [groupDetailsResult];
}

class GroupDetailsNoData extends StudentsState {
  final String message;

  const GroupDetailsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class GroupDetailsError extends StudentsState {
  final String errorMessage;

  const GroupDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
