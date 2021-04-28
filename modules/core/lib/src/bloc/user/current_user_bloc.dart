import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';

class CurrentUserBloc extends Bloc<CurrentUserEvent, CurrentUserState> {
  final Repository repository;

  CurrentUserBloc({this.repository}) : super(InitialCurrentUser());

  get initialState => InitialCurrentUser();

  @override
  Stream<CurrentUserState> mapEventToState(CurrentUserEvent event) async* {
    if (event is GetCurrentUser) {
      yield* _mapGetCurrentUserToState(event);
    } else if (event is UpdateCurrentUserTwo) {
      yield* _mapUpdateUserStateChangeToState(event);
    } else if (event is GetCitiesForMyProfile) {
      yield* _mapGetCitiesForMyProfileToState(event);
    } else if (event is SaveDataToLocalRep) {
      await repository.getCurrentUser('', true);
    } else if (event is CurrentUserStateChange) {
      yield InitialCurrentUser();
    }
  }

  Stream<CurrentUserState> _mapGetCurrentUserToState(
      CurrentUserEvent event) async* {
    try {
      var currentUser = await repository.getCurrentUser('', false);

      if (currentUser.props.isEmpty) {
        yield CurrentUserError('CurrentUserError');
      } else {
        yield CurrentUserHasData(currentUser);
      }
    } catch (e) {
      yield CurrentUserError(e.toString());
    }
  }

  Stream<CurrentUserState> _mapUpdateUserStateChangeToState(
      CurrentUserEvent event) async* {
    try {
      yield UpdateUserLoading();

      print('AHAHAHAHA ${event.id}');

      var response = await repository.updateUser('',
          event.id,
          event.username,
          event.name,
          event.surname,
          event.middleName,
          event.cityId,
          event.phoneNumber,
          event.email);

      if (response == null) {
        yield UpdateUserNoData('UpdateUserNoData');
      } else {
        yield UpdateUserHasData(response);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield UpdateUserNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield UpdateUserNoInternetConnection();
      } else {
        yield UpdateUserError(e.toString());
      }
    } catch (e) {
      yield UpdateUserError(e.toString());
    }
  }

  Stream<CurrentUserState> _mapGetCitiesForMyProfileToState(
      CurrentUserEvent event) async* {
    try {
      yield CitiesForMyProfileLoading();

      var cities = await repository.getCities();

      if (cities.props.isEmpty) {
        yield CitiesForMyProfileError('CitiesForMyProfileError');
      } else {
        yield CitiesForMyProfileHasData(cities);
      }
    } catch (e) {
      yield CitiesForMyProfileError(e.toString());
    }
  }
}
