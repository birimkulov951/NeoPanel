import 'package:equatable/equatable.dart';

import 'package:core/core.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

class InitialCity extends CityState {}

class CityLoading extends CityState {
  final String message;

  const CityLoading([this.message]);

  @override
  List<Object> get props => [message];
}

class CityHasData extends CityState {

  final CitiesResult citiesResult;

  const CityHasData([this.citiesResult]);

  @override
  List<Object> get props => [citiesResult];
}

class CityNoData extends CityState {
  final String message;

  const CityNoData(this.message);

  @override
  List<Object> get props => [message];
}

class CityNoInternetConnection extends CityState {
  final String message;

  const CityNoInternetConnection([this.message]);

  @override
  List<Object> get props => [message];
}

class CityError extends CityState {
  final String errorMessage;

  const CityError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


