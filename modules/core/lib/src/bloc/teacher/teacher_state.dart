import 'package:equatable/equatable.dart';
import 'package:core/core.dart';

abstract class TeacherState extends Equatable {
  const TeacherState();

  @override
  List<Object> get props => [];
}

class InitialTeacher extends TeacherState {}

class TeacherLoading extends TeacherState {
  final String message;

  const TeacherLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class CoursesAndTeacherHasData extends TeacherState {

  final CoursesResult coursesResult;

  final TeachersResult teachersResult;

  const CoursesAndTeacherHasData([this.coursesResult, this.teachersResult]);

  @override
  List<Object> get props => [coursesResult, teachersResult];
}

class TeacherNoData extends TeacherState {
  final String message;

  const TeacherNoData(this.message);

  @override
  List<Object> get props => [message];
}

class TeacherNoInternetConnection extends TeacherState {
  final String message;

  const TeacherNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class TeacherError extends TeacherState {
  final String errorMessage;

  const TeacherError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
