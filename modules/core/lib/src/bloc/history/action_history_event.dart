import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ActionHistoryEvent extends Equatable {
  const ActionHistoryEvent();

  @override
  List<Object> get props => [];
}

class ActionHistoryChanged extends ActionHistoryEvent {
  final bool isAuthorized;

  ActionHistoryChanged({@required this.isAuthorized});

  @override
  List<Object> get props => [isAuthorized];
}

class GetActionHistory extends ActionHistoryEvent {}
