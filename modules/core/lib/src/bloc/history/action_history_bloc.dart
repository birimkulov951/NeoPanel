import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';


class ActionHistoryBloc extends Bloc<ActionHistoryEvent, ActionHistoryState> {
  final SharedPrefHelper prefHelper;

  ActionHistoryBloc({@required this.prefHelper})
      : super(ActionHistoryState(isAuthorized: false));

  @override
  Stream<ActionHistoryState> mapEventToState(
      ActionHistoryEvent event,
  ) async* {
   if (event is GetActionHistory) {
      var _userToken = await prefHelper.getAuthToken();
      var _isAuthorized = false;
      if(_userToken != null) {
        _isAuthorized = true;
      }
      yield ActionHistoryState(isAuthorized: _isAuthorized);
    }
  }
}
