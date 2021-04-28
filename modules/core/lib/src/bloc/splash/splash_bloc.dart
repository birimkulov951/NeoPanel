import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SharedPrefHelper prefHelper;

  SplashBloc({@required this.prefHelper})
      : super(SplashState(isAuthorized: false));

  @override
  Stream<SplashState> mapEventToState(
      SplashEvent event,
  ) async* {
   if (event is GetSplash) {
      var _userToken = await prefHelper.getAuthToken();
      var _isAuthorized = false;
      if(_userToken != null) {
        _isAuthorized = true;
      }
      yield SplashState(isAuthorized: _isAuthorized);
    }
  }
}
