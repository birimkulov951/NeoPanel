import 'package:flutter/material.dart';

import 'package:core/core.dart';

class MainRepository implements Repository {
  final ApiRepository apiRepository;
  final LocalRepository localRepository;

  MainRepository(
      {@required this.apiRepository, @required this.localRepository});



  /// Authorization
  @override
  Future<AuthorizationResult> authorize(
      [String email, String password, isRememberMe]) async {
    var fromDio = await apiRepository.authorize(email, password);
    if (isRememberMe == true) {
      await localRepository.setAuthToken(fromDio.token);
      await localRepository.setTokenExpiration(fromDio.expiration);
    } else {
      await localRepository.setTempToken(fromDio.token);
    }
    return fromDio;
  }

  @override
  Future<GenerateForgotPasswordResult> generateForgotPasswordCode(
      [String email]) async {
    var fromDio = await apiRepository.generateForgotPasswordCode(email);
    /*  Future<void> saveLeadStatusesToLocal([StatusesResult data]) async {
    localRepository.saveLeadStatuses(data);
  }
  Future<void> saveLeadsToLocal(LeadsResult data) async {
    localRepository.saveLeadsByIndexes(data);
  }
  Future<StatusesResult> getLeadStatusesFromLocal() async {
    var fromLocal = await localRepository.getLeadStatuses();
    if (fromLocal != null) {
      return fromLocal;
    } else {
      throw Exception();
    }
  }
  Future<LeadsResult> getLeadsFromLocal() async {
    var fromLocal = await localRepository.getLeadsByIndexes();
    if (fromLocal != null) {
      return fromLocal;
    } else {
      throw Exception();
    }
  }*/
    return fromDio;
  }

  @override
  Future<GenerateNewPasswordResult> generateNewPassword(
      [int code, String email]) async {
    var fromDio = await apiRepository.generateNewPassword(code, email);
    return fromDio;
  }

  /// Lead Status
  @override
  Future<StatusesResult> getLeadStatuses([String token]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }

    try {
      var fromLocal = await localRepository.getLeadStatuses();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.getLeadStatuses(token);
      localRepository.saveLeadStatuses(data);
      return data;
    }
  }

  /// Leads
  @override
  Future<Result> createLead([String token]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.createLead(token);
    return fromDio;
  }

  @override
  Future<LeadsResult> getLeadsByIndexes([String token, bool isFromDio]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    if (isFromDio) {
      final data = await apiRepository.getLeadsByIndexes(token);
      localRepository.saveLeadsByIndexes(data);
      return data;
    }

    try {
      var fromLocal = await localRepository.getLeadsByIndexes();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.getLeadsByIndexes(token);
      localRepository.saveLeadsByIndexes(data);
      return data;
    }
  }

  @override
  Future<LeadDetailsResult> getLeadDetails([String token, int leadId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.getLeadDetails(token, leadId);
    return fromDio;
  }

  @override
  Future<Result> updateLead(
      [String token,
      int id,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phone,
      int courseId,
      int leadStatusId,
      String flexById,
      int leadFailureStatusId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.updateLead(
        token,
        id,
        surname,
        name,
        middleName,
        cityId,
        phone,
        courseId,
        leadStatusId,
        flexById,
        leadFailureStatusId);
    return fromDio;
  }

  @override
  Future<Result> leadFailure(
      [String token,
      int id,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phone,
      int courseId,
      int leadStatusId,
      String flexById,
      int leadFailureStatusId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.leadFailure(
        token,
        id,
        surname,
        name,
        middleName,
        cityId,
        phone,
        courseId,
        leadStatusId,
        flexById,
        leadFailureStatusId);
    return fromDio;
  }

  @override
  Future<Result> updateLeadStatus(
      [String token, int leadId, int leadStatusId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio =
        await apiRepository.updateLeadStatus(token, leadId, leadStatusId);
    return fromDio;
  }

  @override
  Future<Result> deleteLead(String token, int leadId) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.deleteLead(token, leadId);
    return fromDio;
  }

  /// Courses
  @override
  Future<Result> createCourse(
      [String token,
      String name,
      int cityId,
      int teacherId,
      String color]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio =
        await apiRepository.createCourse(token, name, cityId, teacherId, color);
    return fromDio;
  }

  @override
  Future<Result> deleteCourse([String token, courseId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.deleteCourse(token, courseId);
    return fromDio;
  }

  @override
  Future<CourseDetailsResult> getCourseDetails(
      [String token, int courseId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.getCourseDetails(token, courseId);
    return fromDio;
  }

  @override
  Future<CoursesResult> getCourses([String token]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }

    try {
      var fromLocal = await localRepository.getCourses();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.getCourses(token);
      localRepository.saveCourses(data);
      return data;
    }
  }

  @override
  Future<Result> updateCourse(
      [String token,
      int id,
      String name,
      int cityId,
      int teacherId,
      String color]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.updateCourse(
        token, id, name, cityId, teacherId, color);
    return fromDio;
  }

  /// Students
  @override
  Future<Result> createStudent([String token, int leadId, int groupId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.createStudent(token, leadId, groupId);
    return fromDio;
  }

  @override
  Future<StudentsResult> getStudents([String token]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }

    try {
      var fromLocal = await localRepository.getStudents();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.getStudents(token);
      localRepository.saveStudents(data);
      return data;
    }
  }

  @override
  Future<StudentDetailsResult> getStudentDetails(
      [String token, int studentId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.getStudentDetails(token, studentId);
    return fromDio;
  }

  @override
  Future<Result> updateStudent(
      [String token,
      int id,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phone,
      int groupId,
      String email,
      String address,
      bool hasLaptop,
      String discriminator]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.updateStudent(
        token,
        id,
        surname,
        name,
        middleName,
        cityId,
        phone,
        groupId,
        email,
        address,
        hasLaptop,
        discriminator);
    return fromDio;
  }

  @override
  Future<Result> deleteStudent([String token, studentId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.deleteStudent(token, studentId);
    return fromDio;
  }

  /// Teachers
  @override
  Future<Result> createTeacher(
      [String token,
      int id,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phone]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.createTeacher(
        token, id, surname, name, middleName, cityId, phone);
    return fromDio;
  }

  @override
  Future<Result> deleteTeacher([String token, teacherId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.deleteTeacher(token, teacherId);
    return fromDio;
  }

  @override
  Future<TeacherDetailsResult> getTeacherDetails(
      [String token, int teacherId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.getTeacherDetails(token, teacherId);
    return fromDio;
  }

  @override
  Future<TeachersResult> getTeachers([String token]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }

    try {
      var fromLocal = await localRepository.getTeachers();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.getTeachers(token);
      localRepository.saveTeachers(data);
      return data;
    }
  }

  @override
  Future<Result> updateTeacher(
      [String token,
      int id,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phone]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.updateTeacher(
        token, id, surname, name, middleName, cityId, phone);
    return fromDio;
  }

  /// Groups
  @override
  Future<Result> createGroup(
      [String token,
      String name,
      int courseId,
      String startDate,
      String endDate]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.createGroup(
        token, name, courseId, startDate, endDate);
    return fromDio;
  }

  @override
  Future<Result> deleteGroup([String token, int groupId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.deleteGroup(token, groupId);
    return fromDio;
  }

  @override
  Future<GroupDetailsResult> getGroupDetails(
      [String token, int groupId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }

    var fromDio = await apiRepository.getGroupDetails(token, groupId);
    return fromDio;
  }

  @override
  Future<GroupsResult> getGroups([String token]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }

    try {
      var fromLocal = await localRepository.getGroups();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.getGroups(token);
      localRepository.saveGroups(data);
      return data;
    }
  }

  @override
  Future<Result> updateGroup(
      [String token,
      int id,
      String name,
      int cityId,
      String startDate,
      String endDate]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.updateGroup(
        token, id, name, cityId, startDate, endDate);
    return fromDio;
  }

  /// User
  @override
  Future<UsersResult> getUsers([String token]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }

    try {
      var fromLocal = await localRepository.getUsers();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.getUsers(token);
      localRepository.saveUsers(data);
      return data;
    }
  }

  @override
  Future<CurrentUserResult> getCurrentUser(
      [String token, bool isFromDio]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    if (isFromDio) {
      final data = await apiRepository.getCurrentUser(token);
      localRepository.saveCurrentUser(data);
      return data;
    } else {
      var fromLocal = await localRepository.getCurrentUser();

      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    }
  }

  @override
  Future<AuthorizationResult> updateUser(
      [String token,
      int id,
      String username,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phoneNumber,
      String email]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.updateUser(token, id, username, surname,
        name, middleName, cityId, phoneNumber, email);

    if (await localRepository.getAuthToken() != null) {
      localRepository.setAuthToken(fromDio.token);
    } else {
      localRepository.setTempToken(fromDio.token);
    }
    return fromDio;
  }

  /// Cities
  @override
  Future<CitiesResult> getCities([String token]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }

    try {
      var fromLocal = await localRepository.getCities();
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.getCities(token);
      localRepository.saveCities(data);
      return data;
    }
  }

  @override
  Future<CityResult> deleteCity([String token, int cityId]) async {
    String token;
    if (await localRepository.getAuthToken() != null) {
      token = await localRepository.getAuthToken();
    } else {
      token = await localRepository.getTempToken();
    }
    var fromDio = await apiRepository.deleteCity(token);
    return fromDio;
  }

 /* Future<String> getNeededToken() async {
    if (await localRepository.getAuthToken() != null) {
    return await localRepository.getAuthToken();
    } else {
    return await localRepository.getTempToken();
    }
  }*/
}
