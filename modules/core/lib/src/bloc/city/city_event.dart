import 'package:equatable/equatable.dart';

abstract class CityEvent extends Equatable {

  const CityEvent();

  @override
  List<Object> get props => [];
}

class GetCities extends CityEvent {
  GetCities() : super();
}

class CityStateChange extends CityEvent {
  CityStateChange() : super();
}
