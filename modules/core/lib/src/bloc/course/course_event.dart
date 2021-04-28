import 'package:equatable/equatable.dart';

abstract class CourseEvent extends Equatable {

  const CourseEvent();

  @override
  List<Object> get props => [];
}

class GetCourses extends CourseEvent {
  GetCourses() : super();
}

class CoursesStateChange extends CourseEvent {
  CoursesStateChange() : super();
}
