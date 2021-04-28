import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

abstract class TeacherDetailsState extends Equatable {
  const TeacherDetailsState();

  @override
  List<Object> get props => [];
}

class InitialTeacherDetails extends TeacherDetailsState {}

class TeacherDetailsLoading extends TeacherDetailsState {}

class TeacherDetailsHasData extends TeacherDetailsState {

  final TeacherDetailsResult teacherDetailsResult;

  const TeacherDetailsHasData([this.teacherDetailsResult]);

  @override
  List<Object> get props => [teacherDetailsResult];
}

class TeacherDetailsNoData extends TeacherDetailsState {
  final String message;

  const TeacherDetailsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class TeacherDetailsNoInternetConnection extends TeacherDetailsState {}

class TeacherDetailsError extends TeacherDetailsState {
  final String errorMessage;

  const TeacherDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
