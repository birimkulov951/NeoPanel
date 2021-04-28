import 'package:equatable/equatable.dart';
import 'package:core/core.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class InitialCourse extends CourseState {}

class CourseLoading extends CourseState {
  final String message;

  const CourseLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class CourseHasData extends CourseState {

  final CoursesResult coursesResult;

  const CourseHasData([this.coursesResult]);

  @override
  List<Object> get props => [coursesResult];
}

class CourseNoData extends CourseState {
  final String message;

  const CourseNoData(this.message);

  @override
  List<Object> get props => [message];
}

class CourseNoInternetConnection extends CourseState {
  final String message;

  const CourseNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class CourseError extends CourseState {
  final String errorMessage;

  const CourseError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}



class GroupHasData extends CourseState {

  final GroupsResult groupsResult;

  const GroupHasData([this.groupsResult]);

  @override
  List<Object> get props => [groupsResult];
}

class GroupNoData extends CourseState {
  final String message;

  const GroupNoData(this.message);

  @override
  List<Object> get props => [message];
}

