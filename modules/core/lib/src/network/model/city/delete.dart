import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete.g.dart';

@JsonSerializable()
class CityResult extends Equatable {

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  const CityResult(this.status, this.message);

  @override
  List<Object> get props => [status, message];

  factory CityResult.fromJson(Map<String, dynamic> json) => _$CityResultFromJson(json);

  Map<String, dynamic> toJson() => _$CityResultToJson(this);
}