import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

abstract class StudentDetailsState extends Equatable {
  const StudentDetailsState();

  @override
  List<Object> get props => [];
}

class InitialStudentDetails extends StudentDetailsState {}

class StudentDetailsLoading extends StudentDetailsState {}

class StudentDetailsHasData extends StudentDetailsState {

  final StudentDetailsResult studentDetailsResult;

  const StudentDetailsHasData([this.studentDetailsResult]);

  @override
  List<Object> get props => [studentDetailsResult];
}

class StudentDetailsNoData extends StudentDetailsState {
  final String message;

  const StudentDetailsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class StudentDetailsNoInternetConnection extends StudentDetailsState {}

class StudentDetailsError extends StudentDetailsState {
  final String errorMessage;

  const StudentDetailsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
