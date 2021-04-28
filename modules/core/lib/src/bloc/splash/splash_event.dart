import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class AuthorizationChanged extends SplashEvent {
  final bool isAuthorized;

  AuthorizationChanged({@required this.isAuthorized});

  @override
  List<Object> get props => [isAuthorized];
}

class GetSplash extends SplashEvent {}
