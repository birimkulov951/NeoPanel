import 'package:equatable/equatable.dart';

abstract class TeacherDetailsEvent extends Equatable {
  final int teacherId;

  const TeacherDetailsEvent(this.teacherId);

  @override
  List<Object> get props => [teacherId];
}

class LoadTeacherDetails extends TeacherDetailsEvent {
  LoadTeacherDetails(int teacherId) : super(teacherId);
}

class TeacherDetailsStateChange extends TeacherDetailsEvent {
  TeacherDetailsStateChange([int teacherId]) : super(teacherId);
}


