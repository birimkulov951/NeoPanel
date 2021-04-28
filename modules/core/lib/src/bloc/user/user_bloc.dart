import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository repository;

  UserBloc({this.repository}) : super(InitialUser());

  get initialState => InitialUser();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUser) {
        yield* _mapGetUserToState(event);
    } else if (event is UserStateChange) {
      yield* _mapUserStateChangeToState(event);
    }
  }

  Stream<UserState> _mapGetUserToState(UserEvent event) async* {
    try {
      yield UserLoading();

      var users = await repository.getUsers();

      if (users.props.isEmpty) {
        yield UserNoData('UserNoData');
      } else {
        yield UserHasData(users);
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield UserNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield UserNoInternetConnection();
      } else {
        yield UserError(e.toString());
      }
    } catch (e) {
      yield UserError(e.toString());

    }

  }

  Stream<UserState> _mapUserStateChangeToState(UserEvent event) async* {
    yield InitialUser();
  }

}
