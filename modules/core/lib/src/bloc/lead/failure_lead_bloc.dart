import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FailureLeadBloc extends Bloc<FailureLeadEvent, FailureLeadState> {
  final Repository repository;

  FailureLeadBloc({this.repository}) : super(InitialFailureLead());

  get initialState => InitialFailureLead();

  @override
  Stream<FailureLeadState> mapEventToState(FailureLeadEvent event) async* {
    if (event is SubmitLeadFailure) {
        yield* _mapAuthorizeToState(event);
    }
  }

  Stream<FailureLeadState> _mapAuthorizeToState(FailureLeadEvent event) async* {
    try {
      yield FailureLeadLoading();

      var response = await repository.leadFailure('',event.id, event.surname, event.name, event.middleName, event.cityId, event.phone, event.courseId, event.leadStatusId, event.flexById, event.leadFailureStatusId);

      if (response.props.isEmpty) {
        yield FailureLeadNoData('FailureLeadNoData');
      } else {
        yield FailureLeadHasData(response);
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield FailureLeadNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield FailureLeadNoInternetConnection();
      } else {
        yield FailureLeadError(e.toString());
      }
    } catch (e) {
      yield FailureLeadError(e.toString());

    }

  }

 /* Stream<FailureLeadState> _mapAuthorizationChangeState(FailureLeadEvent event) async* {
    yield InitialAuthorization();
  }*/

}
