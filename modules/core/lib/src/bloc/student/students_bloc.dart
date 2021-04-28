import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  final Repository repository;

  StudentsBloc({this.repository}) : super(InitialStudents());

  get initialState => InitialStudents();

  @override
  Stream<StudentsState> mapEventToState(StudentsEvent event) async* {
    if (event is GetStudents) {
        yield* _mapGetStudentsToState(event);
    } else if (event is StudentsStateChange) {
      yield* _mapStudentsStateChangeToState(event);
    } else if (event is GetGroupDetails) {
      yield* _mapGetGroupDetailsToState(event);
    }
  }

  Stream<StudentsState> _mapGetStudentsToState(StudentsEvent event) async* {
    try {
      yield StudentsLoading();

      var response = await repository.getStudents();

      if (response.props.isEmpty) {
        yield StudentsNoData('StudentsNoData');
      } else {
        yield StudentsHasData(response);
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield StudentsNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield StudentsNoInternetConnection();
      } else {
        yield StudentsError(e.toString());
      }
    } catch (e) {
      yield StudentsError(e.toString());

    }

  }

  Stream<StudentsState> _mapStudentsStateChangeToState(StudentsEvent event) async* {
    yield InitialStudents();
  }

  Stream<StudentsState> _mapGetGroupDetailsToState(StudentsEvent event) async* {
    try {
      var response = await repository.getGroupDetails('',event.groupId);

      if (response.props.isEmpty) {
        yield GroupDetailsNoData('StudentsNoData');
      } else {
        yield GroupDetailsHasData(response);
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield StudentsNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield StudentsNoInternetConnection();
      } else {
        yield StudentsError(e.toString());
      }
    } catch (e) {
      yield GroupDetailsError(e.toString());
    }

  }

}
