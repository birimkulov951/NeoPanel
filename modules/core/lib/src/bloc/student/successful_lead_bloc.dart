import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessfulLeadBloc extends Bloc<SuccessfulLeadEvent, SuccessfulLeadState> {
  final Repository repository;

  SuccessfulLeadBloc({this.repository}) : super(InitialSuccessfulLead());

  get initialState => InitialSuccessfulLead();

  @override
  Stream<SuccessfulLeadState> mapEventToState(SuccessfulLeadEvent event) async* {
    if (event is SubmitLeadSuccess) {
        yield* _mapLeadSuccessToState(event);
    } else if (event is LoadCoursesAndGroups) {
      yield* _mapCoursesAndGroupsToState(event);
    } else if(event is LoadGroupDetails) {
      yield* _mapGroupDetailsToState(event);
    } else if (event is SuccessfulLeadStateChange) {
      yield InitialSuccessfulLead();
    }
  }

  Stream<SuccessfulLeadState> _mapLeadSuccessToState(SuccessfulLeadEvent event) async* {
    try {
      yield SuccessfulLeadLoading();
      print('22222222 ${event.groupId}');

      var response = await repository.createStudent('', event.leadId, event.groupId);

      if (response.props.isEmpty) {
        yield SuccessfulLeadNoData('SuccessfulLeadNoData');
      } else {
        yield SuccessfulLeadHasData(response);
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield SuccessfulLeadNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield SuccessfulLeadNoInternetConnection();
      } else {
        yield SuccessfulLeadError(e.toString());
      }
    } catch (e) {
      yield SuccessfulLeadError(e.toString());

    }

  }

  Stream<SuccessfulLeadState> _mapCoursesAndGroupsToState(SuccessfulLeadEvent event) async* {
    try {
      yield LoadCoursesAndGroupsLoading();

      var courses = await repository.getCourses();

      if (courses.props.isEmpty) {
        yield LoadCoursesAndGroupsNoData('LoadCoursesAndGroupsNoData');
      } else {

        var groups = await repository.getGroups();
        if (groups.props.isEmpty) {
          yield LoadCoursesAndGroupsNoData('LoadCoursesAndGroupsNoData');
        } else {
          yield LoadCoursesAndGroupsHasData(courses, groups);
        }
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield SuccessfulLeadNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield SuccessfulLeadNoInternetConnection();
      } else {
        yield LoadCoursesAndGroupsError(e.toString());
      }
    } catch (e) {
      yield LoadCoursesAndGroupsError(e.toString());
    }

  }

  Stream<SuccessfulLeadState> _mapGroupDetailsToState(SuccessfulLeadEvent event) async* {
    try {
      yield GroupDetailsLoadingTwo();

      print('11111111 ${event.groupId}');

      var response = await repository.getGroupDetails('',event.groupId);

      if (response.props.isEmpty) {
        yield GroupDetailsNoDataTwo('GroupDetailsNoData');
      } else {
        yield GroupDetailsHasDataTwo(response);
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield SuccessfulLeadNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield SuccessfulLeadNoInternetConnection();
      } else {
        yield GroupDetailsErrorTwo(e.toString());
      }
    } catch (e) {
      yield GroupDetailsErrorTwo(e.toString());
    }

  }


}
