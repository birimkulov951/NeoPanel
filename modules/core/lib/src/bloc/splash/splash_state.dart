import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SplashState extends Equatable {
  final bool isAuthorized;

  SplashState({@required this.isAuthorized});

  @override
  List<Object> get props => [isAuthorized];
}
