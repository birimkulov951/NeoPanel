import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable()
class StatusesResult extends Equatable {

  @JsonKey(name: 'responseObj')
  final List<Status> results;

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'message')
  final String message;

  const StatusesResult([this.results = const [], this.status, this.message]);

  @override
  List<Object> get props => [status, message, results];

  factory StatusesResult.fromJson(Map<String, dynamic> json) => _$StatusesResultFromJson(json);

  Map<String, dynamic> toJson() => _$StatusesResultToJson(this);

}

@JsonSerializable()
class Status extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  Status(this.id, this.name);

  @override
  List<Object> get props => [
    id,
    name,
  ];

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}