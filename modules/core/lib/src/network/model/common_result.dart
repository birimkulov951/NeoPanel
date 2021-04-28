import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_result.g.dart';

@JsonSerializable()
class Result extends Equatable {
  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  Result(this.status, this.message);

  @override
  List<Object> get props => [status, message];

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}