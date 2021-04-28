import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentDetailsBloc extends Bloc<StudentDetailsEvent, StudentDetailsState> {
  final Repository repository;
  final SharedPrefHelper prefHelper;

  StudentDetailsBloc({this.repository, this.prefHelper}) : super(InitialStudentDetails());

  get initialState => InitialStudentDetails();

  @override
  Stream<StudentDetailsState> mapEventToState(StudentDetailsEvent event) async* {
    if (event is LoadStudentDetails) {
        yield* _mapStudentDetailsToState(event);
    } else if (event is StudentDetailsStateChange) {
      yield InitialStudentDetails();
    }
  }

  Stream<StudentDetailsState> _mapStudentDetailsToState(StudentDetailsEvent event) async* {
    try {
      yield StudentDetailsLoading();

      var response = await repository.getStudentDetails('',event.studentId);

      if (response.props.isNotEmpty) {
        yield StudentDetailsHasData();
      } else {
        yield StudentDetailsNoData('StudentDetailsNoData');
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield StudentDetailsNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield StudentDetailsNoInternetConnection();
      } else {
        yield StudentDetailsError(e.toString());
      }
    } catch (e) {
      yield StudentDetailsError(e.toString());
    }

  }


}
