import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final Repository repository;

  GroupBloc({this.repository}) : super(InitialGroup());

  get initialState => InitialGroup();

  @override
  Stream<GroupState> mapEventToState(GroupEvent event) async* {
    if (event is GetGroups) {
        yield* _mapGetGroupsToState(event);
    } else if (event is GroupsStateChange) {
      yield* _mapGroupsStateChangeToState(event);
    }
  }

  Stream<GroupState> _mapGetGroupsToState(GroupEvent event) async* {
    try {
      yield GroupLoading();

      var courses = await repository.getCourses();

      if (courses.props.isEmpty) {

        yield CoursesNoData('CoursesNoData');

      } else {

        var groups = await repository.getGroups();

        if (groups.props.isEmpty) {

          yield GroupsNoData('GroupsNoData');

        } else {

          yield CoursesAndGroupsHasData(courses, groups);

        }

      }



    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield GroupNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield GroupNoInternetConnection();
      } else {
        yield GroupError(e.toString());
      }
    } catch (e) {
      yield GroupError(e.toString());

    }

  }

  Stream<GroupState> _mapGroupsStateChangeToState(GroupEvent event) async* {
    yield InitialGroup();
  }

}
