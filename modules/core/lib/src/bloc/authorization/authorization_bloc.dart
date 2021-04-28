import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';


class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final Repository repository;

  AuthorizationBloc({this.repository}) : super(InitialAuthorization());

  get initialState => InitialAuthorization();

  @override
  Stream<AuthorizationState> mapEventToState(AuthorizationEvent event) async* {
    if (event is AuthorizationAuthorize) {
      yield* _mapAuthorizeToState(event);
    } else if (event is AuthorizationStateChange) {
      yield* _mapAuthorizationChangeState(event);
    }
  }

  Stream<AuthorizationState> _mapAuthorizeToState(
      AuthorizationEvent event) async* {
    try {
      yield AuthorizationLoading();

      var authorize = await repository.authorize(
          event.email, event.password, event.isRememberMe);

      if (authorize.props.isEmpty) {
        yield AuthorizationNoData('AuthorizationNoData');
      } else {
        var user = await repository.getCurrentUser('', true);
        if (user.props.isEmpty) {
          yield AuthorizationNoData('AuthorizationNoData');
        } else {
          yield AuthorizationHasData(authorize, user);
        }
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield AuthorizationNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield AuthorizationNoInternetConnection();
      } else {
        yield AuthorizationError(e.toString());
      }
    } catch (e) {
      yield AuthorizationError(e.toString());
    }
  }

  Stream<AuthorizationState> _mapAuthorizationChangeState(
      AuthorizationEvent event) async* {
    yield InitialAuthorization();
  }
}
