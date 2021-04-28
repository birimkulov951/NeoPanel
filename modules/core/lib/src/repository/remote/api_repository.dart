import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ApiRepository implements Repository {
  final ApiService apiService;

  ApiRepository({@required this.apiService});

  /// Authorization
  @override
  Future<AuthorizationResult> authorize(
      [String email, String password, bool isRememberMe]) {
    return apiService.authorize(email, password);
  }

  @override
  Future<GenerateForgotPasswordResult> generateForgotPasswordCode(
      [String email]) {
    return apiService.generateForgotPasswordCode(email);
  }

  @override
  Future<GenerateNewPasswordResult> generateNewPassword(
      [int code, String email]) {
    return apiService.generateNewPassword(code, email);
  }

  /// Lead Status
  @override
  Future<StatusesResult> getLeadStatuses([String token]) {
    return apiService.getLeadStatuses(token);
  }

  /// Leads
  @override
  Future<Result> createLead([String token]) {
    return apiService.createLead(token);
  }

  @override
  Future<LeadsResult> getLeadsByIndexes([String token, bool isFromDio]) {
    return apiService.getLeadsByIndexes(token);
  }

  @override
  Future<LeadDetailsResult> getLeadDetails([String token, int leadId]) {
    return apiService.getLeadDetails(token, leadId);
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
      int leadFailureStatusId]) {
    return apiService.updateLead(token, id, surname, name, middleName, cityId,
        phone, courseId, leadStatusId, flexById, leadFailureStatusId);
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
      int leadFailureStatusId]) {
    return apiService.leadFailure(token, id, surname, name, middleName, cityId,
        phone, courseId, leadStatusId, flexById, leadFailureStatusId);
  }

  @override
  Future<Result> updateLeadStatus(
      [String token, int leadId, int leadStatusId]) {
    return apiService.updateLeadStatus(token, leadId, leadStatusId);
  }

  @override
  Future<Result> deleteLead(String token, int leadId) {
    return apiService.deleteLead(token, leadId);
  }

  /// Courses
  @override
  Future<Result> createCourse(
      [String token, String name, int cityId, int teacherId, String color]) {
    return apiService.createCourse(token, name, cityId, teacherId, color);
  }

  @override
  Future<Result> deleteCourse([String token, courseId]) {
    return apiService.deleteCourse(token, courseId);
  }

  @override
  Future<CourseDetailsResult> getCourseDetails([String token, int courseId]) {
    return apiService.getCourseDetails(token, courseId);
  }

  @override
  Future<CoursesResult> getCourses([String token]) {
    return apiService.getCourses(token);
  }

  @override
  Future<Result> updateCourse(
      [String token,
      int id,
      String name,
      int cityId,
      int teacherId,
      String color]) {
    return apiService.updateCourse(token, id, name, cityId, teacherId, color);
  }

  /// Students
  @override
  Future<Result> createStudent([String token, int leadId, int groupId]) {
    return apiService.createStudent(token, leadId, groupId);
  }

  @override
  Future<StudentsResult> getStudents([String token]) {
    return apiService.getStudents(token);
  }

  @override
  Future<StudentDetailsResult> getStudentDetails(
      [String token, int studentId]) {
    return apiService.getStudentDetails(token, studentId);
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
      String discriminator]) {
    return apiService.updateStudent(token, id, surname, name, middleName,
        cityId, phone, groupId, email, address, hasLaptop, discriminator);
  }

  @override
  Future<Result> deleteStudent([String token, studentId]) {
    return apiService.deleteStudent(token, studentId);
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
      String phone]) {
    return apiService.createTeacher(
        token, id, surname, name, middleName, cityId, phone);
  }

  @override
  Future<Result> deleteTeacher([String token, teacherId]) {
    return apiService.deleteTeacher(token, teacherId);
  }

  @override
  Future<TeacherDetailsResult> getTeacherDetails(
      [String token, int teacherId]) {
    return apiService.getTeacherDetails(token, teacherId);
  }

  @override
  Future<TeachersResult> getTeachers([String token]) {
    return apiService.getTeachers(token);
  }

  @override
  Future<Result> updateTeacher(
      [String token,
      int id,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phone]) {
    return apiService.updateTeacher(
        token, id, surname, name, middleName, cityId, phone);
  }

  /// Groups
  @override
  Future<Result> createGroup(
      [String token,
      String name,
      int courseId,
      String startDate,
      String endDate]) {
    return apiService.createGroup(token, name, courseId, startDate, endDate);
  }

  @override
  Future<Result> deleteGroup([String token, int groupId]) {
    return apiService.deleteGroup(token, groupId);
  }

  @override
  Future<GroupDetailsResult> getGroupDetails([String token, int groupId]) {
    return apiService.getGroupDetails(token, groupId);
  }

  @override
  Future<GroupsResult> getGroups([String token]) {
    return apiService.getGroups(token);
  }

  @override
  Future<Result> updateGroup(
      [String token,
      int id,
      String name,
      int cityId,
      String startDate,
      String endDate]) {
    return apiService.updateGroup(token, id, name, cityId, startDate, endDate);
  }

  /// User Details
  @override
  Future<UsersResult> getUsers([String token]) {
    return apiService.getUsers(token);
  }

  @override
  Future<CurrentUserResult> getCurrentUser([String token, bool isFromDio]) {
    return apiService.getCurrentUser(token);
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
      String email]) {
    return apiService.updateUser(token, id, username, surname, name, middleName,
        cityId, phoneNumber, email);
  }

  /// Cities
  @override
  Future<CitiesResult> getCities([String token]) {
    return apiService.getCities(token);
  }

  @override
  Future<CityResult> deleteCity([String token, int cityId]) {
    return apiService.deleteCity(token, cityId);
  }
}
