import 'package:equatable/equatable.dart';

abstract class GroupEvent extends Equatable {

  const GroupEvent();

  @override
  List<Object> get props => [];
}

class GetGroups extends GroupEvent {
  GetGroups() : super();
}

class GroupsStateChange extends GroupEvent {
  GroupsStateChange() : super();
}
