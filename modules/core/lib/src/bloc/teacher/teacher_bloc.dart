import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final Repository repository;

  TeacherBloc({this.repository}) : super(InitialTeacher());

  get initialState => InitialTeacher();

  @override
  Stream<TeacherState> mapEventToState(TeacherEvent event) async* {
    if (event is GetTeachers) {
        yield* _mapGetTeachersToState(event);
    } else if (event is TeacherStateChange) {
      yield* _mapTeacherStateChangeToState(event);
    }
  }

  Stream<TeacherState> _mapGetTeachersToState(TeacherEvent event) async* {
    try {
      yield TeacherLoading();

      var courses = await repository.getCourses();

      if (courses.props.isEmpty) {
        yield TeacherNoData('TeacherNoData');
      } else {
        var teachers = await repository.getTeachers();
        if (teachers.props.isEmpty) {
          yield TeacherNoData('TeacherNoData');
        } else {
          yield CoursesAndTeacherHasData(courses, teachers);
        }
      }



    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield TeacherNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield TeacherNoInternetConnection();
      } else {
        yield TeacherError(e.toString());
      }
    } catch (e) {
      yield TeacherError(e.toString());

    }

  }

  Stream<TeacherState> _mapTeacherStateChangeToState(TeacherEvent event) async* {
    yield InitialTeacher();
  }

}
