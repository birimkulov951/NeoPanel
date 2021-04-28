import 'package:equatable/equatable.dart';

abstract class LeadsEvent extends Equatable {

  final int leadId;
  final int leadStatusId;

  const LeadsEvent(this.leadId, this.leadStatusId);

  @override
  List<Object> get props => [leadId, leadStatusId];
}

class LoadLeads extends LeadsEvent {
  LoadLeads([int leadId, int leadStatusId]) : super(leadId, leadStatusId);
}

class ChangeLeadStatus extends LeadsEvent {
  ChangeLeadStatus([int leadId, int leadStatusId]) : super(leadId, leadStatusId);
}

class LoadLeadsFromDio extends LeadsEvent {
  LoadLeadsFromDio([int leadId, int leadStatusId]) : super(leadId, leadStatusId);
}


