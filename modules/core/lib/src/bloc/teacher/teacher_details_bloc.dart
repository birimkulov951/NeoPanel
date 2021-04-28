import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

class TeacherDetailsBloc extends Bloc<TeacherDetailsEvent, TeacherDetailsState> {
  final Repository repository;

  TeacherDetailsBloc({this.repository}) : super(InitialTeacherDetails());

  get initialState => InitialTeacherDetails();

  @override
  Stream<TeacherDetailsState> mapEventToState(TeacherDetailsEvent event) async* {
    if (event is LoadTeacherDetails) {
        yield* _mapTeacherDetailsToState(event);
    } else if (event is TeacherDetailsStateChange) {
      yield InitialTeacherDetails();
    }
  }

  Stream<TeacherDetailsState> _mapTeacherDetailsToState(TeacherDetailsEvent event) async* {
    try {
      yield TeacherDetailsLoading();

      var response = await repository.getTeacherDetails('',event.teacherId);

      if (response.props.isEmpty) {
        yield TeacherDetailsNoData('TeacherDetailsNoData');
      } else {
        yield TeacherDetailsHasData(response);
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield TeacherDetailsNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield TeacherDetailsNoInternetConnection();
      } else {
        yield TeacherDetailsError(e.toString());
      }
    } catch (e) {
      yield TeacherDetailsError(e.toString());
    }

  }


}
