import 'package:equatable/equatable.dart';

abstract class CurrentUserEvent extends Equatable {

  final int id;
  final String username;
  final String surname;
  final String name;
  final String middleName;
  final int cityId;
  final String phoneNumber;
  final String email;

  const CurrentUserEvent(this.id, this.username, this.surname, this.name, this.middleName, this.cityId, this.phoneNumber, this.email);

  @override
  List<Object> get props => [id, username, surname, name, middleName, cityId, phoneNumber, email];
}

class GetCurrentUser extends CurrentUserEvent {
  GetCurrentUser([int id, String username, String surname, String name, String middleName, int cityId, String phoneNumber, String email])
      :super(id, username, surname, name, middleName, cityId, phoneNumber, email);
}

class UpdateCurrentUserTwo extends CurrentUserEvent {
  UpdateCurrentUserTwo(int id, String username, String surname, String name, String middleName, int cityId, String phoneNumber, String email)
      :super(id, username, surname, name, middleName, cityId, phoneNumber, email);}

class GetCitiesForMyProfile extends CurrentUserEvent {
  GetCitiesForMyProfile([int id, String username, String surname, String name, String middleName, int cityId, String phoneNumber, String email])
      :super(id, username, surname, name, middleName, cityId, phoneNumber, email);}

class SaveDataToLocalRep extends CurrentUserEvent {
  SaveDataToLocalRep([int id, String username, String surname, String name, String middleName, int cityId, String phoneNumber, String email])
      :super(id, username, surname, name, middleName, cityId, phoneNumber, email);}



class CurrentUserStateChange extends CurrentUserEvent {
  CurrentUserStateChange([int id, String username, String surname, String name, String middleName, int cityId, String phoneNumber, String email])
      :super(id, username, surname, name, middleName, cityId, phoneNumber, email);
}
