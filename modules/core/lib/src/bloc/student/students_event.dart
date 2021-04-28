import 'package:equatable/equatable.dart';

abstract class StudentsEvent extends Equatable {
  final int groupId;

  const StudentsEvent(this.groupId);

  @override
  List<Object> get props => [groupId];
}

class GetStudents extends StudentsEvent {
  GetStudents([int groupId]) : super(groupId);
}

class StudentsStateChange extends StudentsEvent {
  StudentsStateChange([int groupId]) : super(groupId);
}

class GetGroupDetails extends StudentsEvent {
  GetGroupDetails(int groupId) : super(groupId);
}

