import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ActionHistoryState extends Equatable {
  final bool isAuthorized;

  ActionHistoryState({@required this.isAuthorized});

  @override
  List<Object> get props => [isAuthorized];
}
