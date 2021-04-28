import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  final Repository repository;

  LeadsBloc({@required this.repository})
      : super(InitialLeadsState());

  get initialState => InitialLeadsState();

  @override
  Stream<LeadsState> mapEventToState(LeadsEvent event) async* {
    if (event is LoadLeads) {
      yield* _mapLeadsToState(event);
    } else if (event is ChangeLeadStatus) {
      yield* _mapLeadStatusChangeToState(event);
    } else if (event is LoadLeadsFromDio) {
      yield* _mapLeadsFromDioToState(event);
    }
  }

  Stream<LeadsState> _mapLeadsToState(LeadsEvent event) async* {
    try {
      yield LeadsLoading();

      print(event.props.toString());
      var leadStatuses = await repository.getLeadStatuses();
      print(event.props.toString());

      if (leadStatuses.props.isEmpty) {
        yield LeadsNoData('LeadsNoData');
      } else {
        var leads = await repository.getLeadsByIndexes('',false);
        if (leads.props.isEmpty) {
          yield LeadsNoData('LeadsNoData');
        } else {
          yield LeadsHasData(leadStatuses, leads);
        }
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield LeadsNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield LeadsNoInternetConnection();
      } else {
        yield LeadsError(e.toString());
      }
    } catch (e) {
      yield LeadsError(e.toString());
    }

  }

  Stream<LeadsState> _mapLeadStatusChangeToState(LeadsEvent event) async* {
    try {

      yield LeadStatusChangeLoading();

      var response = await repository.updateLeadStatus('',event.leadId, event.leadStatusId);

      if (response.props.isEmpty) {
        yield LeadStatusChangeNoData('LeadStatusesNoData');
      } else {
        yield LeadStatusChangeHasData(response);
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield LeadStatusChangeNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield LeadStatusChangeNoInternetConnection();
      } else {
        yield LeadStatusChangeError(e.toString());
      }
    } catch (e) {
      yield LeadStatusChangeError(e.toString());
    }

  }

  Stream<LeadsState> _mapLeadsFromDioToState(LeadsEvent event) async* {
    try {

      yield LeadStatusChangeLoading();

      var leadStatuses = await repository.getLeadStatuses();

      if (leadStatuses.props.isEmpty) {
        yield LoadLeadsFromDioNoData('LoadLeadsFromDioNoData');
      } else {
        var leads = await repository.getLeadsByIndexes();
        if (leads.props.isEmpty) {
          yield LoadLeadsFromDioNoData('LoadLeadsFromDioNoData');
        } else {
          yield LoadLeadsFromDioHasData(leadStatuses, leads);
        }
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield LeadStatusChangeNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield LeadStatusChangeNoInternetConnection();
      } else {
        yield LoadLeadsFromDioError(e.toString());
      }
    } catch (e) {
      yield LoadLeadsFromDioError(e.toString());
    }

  }


}
