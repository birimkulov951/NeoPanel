import 'package:equatable/equatable.dart';

abstract class TeacherEvent extends Equatable {

  const TeacherEvent();

  @override
  List<Object> get props => [];
}

class GetTeachers extends TeacherEvent {
  GetTeachers() : super();
}

class TeacherStateChange extends TeacherEvent {
  TeacherStateChange() : super();
}
