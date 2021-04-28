import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeadDetailsBloc extends Bloc<LeadDetailsEvent, LeadDetailsState> {
  final Repository repository;
  final SharedPrefHelper prefHelper;

  LeadDetailsBloc({this.repository, this.prefHelper}) : super(InitialLeadDetails());

  get initialState => InitialLeadDetails();

  @override
  Stream<LeadDetailsState> mapEventToState(LeadDetailsEvent event) async* {
    if (event is LoadLeadDetails) {
        yield* _mapLeadDetailsToState(event);
    } else if (event is LeadStatusChange) {
      yield* _mapLeadStatusChangeToState(event);
    } else if (event is LoadStatuses) {
      yield* _mapLoadLeadStatusesToState(event);
    } else if (event is LeadDetailsStateChange) {
      yield InitialLeadDetails();
    }
  }

  Stream<LeadDetailsState> _mapLeadDetailsToState(LeadDetailsEvent event) async* {
    try {
      yield LeadDetailsLoading();

      var response = await repository.getLeadDetails('',event.leadId);

      if (response.props.isNotEmpty) {
        yield LeadDetailsHasData(response);
      } else {
        yield LeadDetailsNoData('LeadDetailsNoData');
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield LeadDetailsNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield LeadDetailsNoInternetConnection();
      } else {
        yield LeadDetailsError(e.toString());
      }
    } catch (e) {
      yield LeadDetailsError(e.toString());
    }

  }

  Stream<LeadDetailsState> _mapLoadLeadStatusesToState(LeadDetailsEvent event) async* {
    try {
      yield LeadStatusesLoading();

      var response = await repository.getLeadStatuses();

      if (response.props.isNotEmpty) {
        yield LeadStatusesHasData(response);
      } else {
        yield LeadStatusesNoData('LeadStatusesNoData');
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield LeadDetailsNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield LeadDetailsNoInternetConnection();
      } else {
        yield LeadStatusesError(e.toString());
      }
    } catch (e) {
      yield LeadStatusesError(e.toString());
    }

  }

  Stream<LeadDetailsState> _mapLeadStatusChangeToState(LeadDetailsEvent event) async* {
    try {
      yield LeadStatusChangeLoadingTwo();

      var response = await repository.updateLeadStatus('',event.leadStatusId, event.leadStatusId);

      if (response.props.isNotEmpty) {
        yield LeadStatusChangeHasDataTwo(response);
        await repository.getLeadsByIndexes('',true);

      } else {
        yield LeadStatusChangeNoDataTwo('LeadStatusChangeNoData');
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield LeadDetailsNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield LeadDetailsNoInternetConnection();
      } else {
        yield LeadStatusChangeErrorTwo(e.toString());
      }
    } catch (e) {
      yield LeadStatusChangeErrorTwo(e.toString());
    }

  }

}
