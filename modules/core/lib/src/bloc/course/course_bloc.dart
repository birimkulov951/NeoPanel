import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';


class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final Repository repository;

  CourseBloc({this.repository}) : super(InitialCourse());

  get initialState => InitialCourse();

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    if (event is GetCourses) {
        yield* _mapGetCoursesToState(event);
    } else if (event is CoursesStateChange) {
      yield* _mapCoursesStateChangeToState(event);
    }
  }

  Stream<CourseState> _mapGetCoursesToState(CourseEvent event) async* {
    try {
      yield CourseLoading();

      var courses = await repository.getCourses();

      if (courses.props.isEmpty) {
        yield CourseNoData('CourseNoData');
      } else {
        yield CourseHasData(courses);
        var groups = await repository.getGroups();
        if (groups.props.isEmpty) {
          yield GroupNoData('GroupNoData');
        } else {
          yield GroupHasData(groups);
        }
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield CourseNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield CourseNoInternetConnection();
      } else {
        yield CourseError(e.toString());
      }
    } catch (e) {
      yield CourseError(e.toString());

    }

  }

  Stream<CourseState> _mapCoursesStateChangeToState(CourseEvent event) async* {
    yield InitialCourse();
  }

}
