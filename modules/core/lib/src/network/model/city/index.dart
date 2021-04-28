import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class CitiesResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'responseObj')
  final List<City> results;

  const CitiesResult(this.status, this.message, [this.results = const []]);

  @override
  List<Object> get props => [status, message, results];

  factory CitiesResult.fromJson(Map<String, dynamic> json) => _$CitiesResultFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesResultToJson(this);
}

@JsonSerializable()
class City extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'createDate')
  final String createDate;

  @JsonKey(name: 'groupsCount')
  final int groupsCount;

  City (this.id, this.name, this.createDate, this.groupsCount);

  @override
  List<Object> get props => [
    id,
    name,
    createDate,
    groupsCount
  ];

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}