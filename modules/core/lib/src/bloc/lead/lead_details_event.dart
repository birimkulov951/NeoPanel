import 'package:equatable/equatable.dart';

abstract class LeadDetailsEvent extends Equatable {
  final int leadId;
  final int leadStatusId;

  const LeadDetailsEvent(this.leadId, this.leadStatusId);

  @override
  List<Object> get props => [leadId, leadStatusId];
}

class LoadLeadDetails extends LeadDetailsEvent {
  LoadLeadDetails(int leadId, int leadStatusId) : super(leadId, leadStatusId);
}

class LoadStatuses extends LeadDetailsEvent {
  LoadStatuses([int leadId, int leadStatusId]) : super(leadId, leadStatusId);
}

class LeadStatusChange extends LeadDetailsEvent {
  LeadStatusChange(int leadId, int leadStatusId) : super(leadId, leadStatusId);
}

class LeadDetailsStateChange extends LeadDetailsEvent {
  LeadDetailsStateChange([int leadId, int leadStatusId]) : super(leadId, leadStatusId);
}


