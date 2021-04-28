import 'package:equatable/equatable.dart';

abstract class SuccessfulLeadEvent extends Equatable {

  final int leadId;
  final int groupId;

  const SuccessfulLeadEvent(this.leadId, this.groupId);

  @override
  List<Object> get props => [leadId, groupId];
}

class SubmitLeadSuccess extends SuccessfulLeadEvent {
  SubmitLeadSuccess(int leadId, int groupId) : super(leadId, groupId);
}

class LoadCoursesAndGroups extends SuccessfulLeadEvent {
  LoadCoursesAndGroups([int leadId, int groupId]) : super(leadId, groupId);
}

class LoadGroupDetails extends SuccessfulLeadEvent {
  LoadGroupDetails(int leadId, int groupId) : super(leadId, groupId);
}

class SuccessfulLeadStateChange extends SuccessfulLeadEvent {
  SuccessfulLeadStateChange([int leadId, int groupId]) : super(leadId, groupId);
}
