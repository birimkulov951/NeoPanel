import 'package:equatable/equatable.dart';

abstract class StudentDetailsEvent extends Equatable {
  final int studentId;

  const StudentDetailsEvent(this.studentId);

  @override
  List<Object> get props => [studentId];
}

class LoadStudentDetails extends StudentDetailsEvent {
  LoadStudentDetails(int studentId) : super(studentId);
}

class StudentDetailsStateChange extends StudentDetailsEvent {
  StudentDetailsStateChange([int studentId]) : super(studentId);
}


