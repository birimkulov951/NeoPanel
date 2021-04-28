class BoardItemObject {
  int id;
  String surname;
  String name;
  String phone;
  String cityName;
  String courseName;
  String leadStatus;


  BoardItemObject({
    this.id,
    this.surname,
    this.name,
    this.phone,
    this.cityName,
    this.courseName,
    this.leadStatus
  }) {
    if (this.id == null) {
      this.id = -1;
    }
    if (this.surname == null) {
      this.surname = "";
    }
    if (this.name == null) {
      this.name = "";
    }
    if (this.phone == null) {
      this.phone = "";
    }
    if (this.cityName == null) {
      this.cityName = "";
    }
    if (this.courseName == null) {
      this.courseName = "";
    }
    if (this.leadStatus == null) {
      this.leadStatus = "";
    }


  }
}
