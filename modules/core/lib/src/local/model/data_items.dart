class CourseItem {
  int id;
  String name;
  String color;
  CourseItem({this.id, this.name, this.color}) {
    if (this.id == null) {
      this.id = -1;
    }
    if (this.name == null) {
      this.name = "";
    }
    if (this.color == null) {
      this.color = "";
    }
  }
}

class GroupItem {
  int id;
  String name;
  String cityName;
  int months;
  String course;

  GroupItem({this.id, this.name,this.cityName, this.months, this.course}) {
    if (this.id == null) {
      this.id = -1;
    }
    if (this.name == null) {
      this.name = "";
    }
    if (this.cityName == null) {
      this.cityName = "";
    }
    if (this.months == null) {
      this.months = -1;
    }
    if (this.course == null) {
      this.course = "";
    }
  }
}

class StudentItem {
  int id;
  String surname;
  String name;
  String middleName;
  String cityName;
  String groupName;
  String teacherName;
  String startDate;
  String endDate;
  String paymentStatus;

  StudentItem({this.id, this.surname, this.name, this.middleName, this.cityName, this.groupName, this.teacherName, this.startDate, this.endDate, this.paymentStatus}) {
    if (this.id == null) {
      this.id = -1;
    }
    if (this.surname == null) {
      this.surname = "";
    }
    if (this.name == null) {
      this.name = "";
    }
    if (this.middleName == null) {
      this.middleName = "";
    }
    if (this.cityName == null) {
      this.cityName = "";
    }
    if (this.groupName == null) {
      this.groupName = "";
    }
    if (this.teacherName == null) {
      this.teacherName = "";
    }
    if (this.startDate == null) {
      this.startDate = "";
    }
    if (this.endDate == null) {
      this.endDate = "";
    }
    if (this.paymentStatus == null) {
      this.paymentStatus = "";
    }
  }

}

class TeacherItem {
  bool isExpanded;
  int id;
  String name;
  String surname;
  String middleName;
  String city;
  String course;
  String monday;
  String tuesday;
  String wednesday;
  String thursday;
  String friday;
  String saturday;
  String sunday;

  TeacherItem({this.isExpanded, this.id, this.city, this.name, this.surname, this.middleName, this.course, this.monday, this.tuesday, this.wednesday, this.thursday, this.friday, this.saturday, this.sunday}) {
    if (this.id == null) {
      this.id = -1;
    }
    if (this.isExpanded == null) {
      this.isExpanded = false;
    }
    if (this.city == null) {
      this.city = "";
    }
    if (this.name == null) {
      this.name = "";
    }
    if (this.surname == null) {
      this.surname = "";
    }
    if (this.middleName == null) {
      this.middleName = "";
    }
    if (this.course == null) {
      this.course = "";
    }
    if (this.monday == null) {
      this.monday = "";
    }
    if (this.tuesday == null) {
      this.tuesday = "";
    }
    if (this.wednesday == null) {
      this.wednesday = "";
    }
    if (this.thursday == null) {
      this.thursday = "";
    }
    if (this.friday == null) {
      this.friday = "";
    }
    if (this.saturday == null) {
      this.saturday = "";
    }
    if (this.sunday == null) {
      this.sunday = "";
    }
  }

}

class CommentItem {
  int id;
  String userName;
  String commentDateTime;
  String comment;
  int leadId;

  CommentItem({this.id, this.userName,this.commentDateTime, this.comment, this.leadId}) {
    if (this.id == null) {
      this.id = -1;
    }
    if (this.userName == null) {
      this.userName = "";
    }
    if (this.commentDateTime == null) {
      this.commentDateTime = "";
    }
    if (this.comment == null) {
      this.comment = "";
    }
    if (this.leadId == null) {
      this.leadId = -1;
    }
  }
}

class CourseTeacherList {

  String courseName;
  List<TeacherItem> teachers;

  CourseTeacherList({this.courseName, this.teachers}) {
    if (this.courseName == null) {
      this.courseName = "";
    }
    if (this.teachers == null) {
      this.teachers = [];
    }
  }
}

class CourseGroupList {

  String courseName;
  List<GroupItem> groups;

  CourseGroupList({this.courseName, this.groups}) {
    if (this.courseName == null) {
      this.courseName = "";
    }
    if (this.groups == null) {
      this.groups = [];
    }
  }
}