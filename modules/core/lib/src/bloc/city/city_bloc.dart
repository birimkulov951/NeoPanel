import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final Repository repository;

  CityBloc({this.repository}) : super(InitialCity());

  get initialState => InitialCity();

  @override
  Stream<CityState> mapEventToState(CityEvent event) async* {
    if (event is GetCities) {
        yield* _mapGetCitiesToState(event);
    } else if (event is CityStateChange) {
      yield* _mapCityStateChangeToState(event);
    }
  }

  Stream<CityState> _mapGetCitiesToState(CityEvent event) async* {
    try {
      yield CityLoading();

      var cities = await repository.getCities();

      if (cities.props.isEmpty) {
        yield CityNoData('CityNoData');
      } else {
        yield CityHasData(cities);
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield CityNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield CityNoInternetConnection();
      } else {
        yield CityError(e.toString());
      }
    } catch (e) {
      yield CityError(e.toString());

    }

  }

  Stream<CityState> _mapCityStateChangeToState(CityEvent event) async* {
    yield InitialCity();
  }

}
