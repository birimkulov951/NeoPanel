import 'package:equatable/equatable.dart';

abstract class FailureLeadEvent extends Equatable {

  final int id;
  final String surname;
  final String name;
  final String middleName;
  final int cityId;
  final String phone;
  final int courseId;
  final int leadStatusId;
  final String flexById;
  final int leadFailureStatusId;

  FailureLeadEvent(this.id, this.surname, this.name, this.middleName, this.cityId, this.phone, this.courseId, this.leadStatusId, this.flexById, this.leadFailureStatusId);

  @override
  List<Object> get props => [id, surname, name, middleName, cityId, phone, courseId, leadStatusId, flexById, leadFailureStatusId];
}

class SubmitLeadFailure extends FailureLeadEvent {
  SubmitLeadFailure(int id, String surname, String name, String middleName, int cityId, String phone, int courseId, int leadStatusId, String flexById, int leadFailureStatusId) : super(id, surname, name, middleName, cityId, phone, courseId, leadStatusId, flexById, leadFailureStatusId);
}

class FailureLeadStateChange extends FailureLeadEvent {
  FailureLeadStateChange([int id, String surname, String name, String middleName, int cityId, String phone, int courseId, int leadStatusId, String flexById, int leadFailureStatusId]) : super(id, surname, name, middleName, cityId, phone, courseId, leadStatusId, flexById, leadFailureStatusId);
}
