import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {

  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  GetUser() : super();
}

class UserStateChange extends UserEvent {
  UserStateChange() : super();
}
