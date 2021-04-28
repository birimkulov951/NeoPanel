import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LocalRepository implements Repository {
  final SharedPrefHelper prefHelper;

  LocalRepository({@required this.prefHelper});

  /// AuthToken getter and setter
  Future<void> setAuthToken(String token) {
    return prefHelper.setAuthToken(token);
  }

  Future<String> getAuthToken() {
    return prefHelper.getAuthToken();
  }

  /// TokenExpiration getter and setter
  Future<void> setTokenExpiration(String date) {
    return prefHelper.setTokenExpiration(date);
  }

  Future<String> getTokenExpiration() {
    return prefHelper.getTokenExpiration();
  }

  /// TempToken getter and setter
  Future<void> setTempToken(String token) {
    return prefHelper.setTempToken(token);
  }

  Future<String> getTempToken() {
    return prefHelper.getTempToken();
  }

  /// Authorization
  @override
  Future<AuthorizationResult> authorize(
      [String email, String password, bool isRememberMe]) {
    throw UnimplementedError();
  }

  @override
  Future<GenerateForgotPasswordResult> generateForgotPasswordCode(
      [String email]) {
    throw UnimplementedError();
  }

  @override
  Future<GenerateNewPasswordResult> generateNewPassword(
      [int code, String email]) {
    throw UnimplementedError();
  }

  /// Lead Status
  Future<bool> saveLeadStatuses(StatusesResult result) {
    return prefHelper.storeCache(
        AppConstants.LEAD_STATUSES, jsonEncode(result));
  }

  @override
  Future<StatusesResult> getLeadStatuses([String token]) async {
    var fromCache = await prefHelper.getCache(AppConstants.LEAD_STATUSES);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return StatusesResult.fromJson(json);
    }
    return null;
  }

  /// Leads
  @override
  Future<Result> createLead([String token]) {
    throw UnimplementedError();
  }

  Future<bool> saveLeadsByIndexes(LeadsResult result) {
    return prefHelper.storeCache(AppConstants.LEADS, jsonEncode(result));
  }

  @override
  Future<LeadsResult> getLeadsByIndexes([String token, bool isFromDio]) async {
    var fromCache = await prefHelper.getCache(AppConstants.LEADS);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return LeadsResult.fromJson(json);
    }
    return null;
  }

  @override
  Future<LeadDetailsResult> getLeadDetails([String token, int leadId]) {
    throw UnimplementedError();
  }

  @override
  Future<Result> updateLead([String token]) {
    throw UnimplementedError();
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
    throw UnimplementedError();
  }

  @override
  Future<Result> updateLeadStatus(
      [String token, int leadId, int leadStatusId]) {
    throw UnimplementedError();
  }

  @override
  Future<Result> deleteLead(String token, int leadId) {
    throw UnimplementedError();
  }

  /// Courses
  @override
  Future<Result> createCourse(
      [String token, String name, int cityId, int teacherId, String color]) {
    throw UnimplementedError();
  }

  @override
  Future<Result> deleteCourse([String token, courseId]) {
    throw UnimplementedError();
  }

  @override
  Future<CourseDetailsResult> getCourseDetails([String token, int courseId]) {
    throw UnimplementedError();
  }

  Future<bool> saveCourses(CoursesResult result) {
    return prefHelper.storeCache(AppConstants.COURSES, jsonEncode(result));
  }

  @override
  Future<CoursesResult> getCourses([String token]) async {
    var fromCache = await prefHelper.getCache(AppConstants.COURSES);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return CoursesResult.fromJson(json);
    }
    return null;
  }

  @override
  Future<Result> updateCourse(
      [String token,
      int id,
      String name,
      int cityId,
      int teacherId,
      String color]) {
    throw UnimplementedError();
  }

  /// Students
  @override
  Future<Result> createStudent([String token, int leadId, int groupId]) {
    throw UnimplementedError();
  }

  Future<bool> saveStudents(StudentsResult result) {
    return prefHelper.storeCache(AppConstants.STUDENTS, jsonEncode(result));
  }

  @override
  Future<StudentsResult> getStudents([String token]) async {
    var fromCache = await prefHelper.getCache(AppConstants.STUDENTS);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return StudentsResult.fromJson(json);
    }
    return null;
  }

  @override
  Future<StudentDetailsResult> getStudentDetails(
      [String token, int studentId]) {
    throw UnimplementedError();
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
    throw UnimplementedError();
  }

  @override
  Future<Result> deleteStudent([String token, studentId]) {
    throw UnimplementedError();
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
    throw UnimplementedError();
  }

  @override
  Future<Result> deleteTeacher([String token, teacherId]) {
    throw UnimplementedError();
  }

  @override
  Future<TeacherDetailsResult> getTeacherDetails(
      [String token, int teacherId]) {
    throw UnimplementedError();
  }

  Future<bool> saveTeachers(TeachersResult result) {
    return prefHelper.storeCache(AppConstants.TEACHERS, jsonEncode(result));
  }

  @override
  Future<TeachersResult> getTeachers([String token]) async {
    var fromCache = await prefHelper.getCache(AppConstants.TEACHERS);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return TeachersResult.fromJson(json);
    }
    return null;
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
    throw UnimplementedError();
  }

  /// Groups
  @override
  Future<Result> createGroup(
      [String token,
      String name,
      int courseId,
      String startDate,
      String endDate]) {
    throw UnimplementedError();
  }

  @override
  Future<Result> deleteGroup([String token, int groupId]) {
    throw UnimplementedError();
  }

  @override
  Future<GroupDetailsResult> getGroupDetails([String token, int groupId]) {
    throw UnimplementedError();
  }

  Future<bool> saveGroups(GroupsResult result) {
    return prefHelper.storeCache(AppConstants.GROUPS, jsonEncode(result));
  }

  @override
  Future<GroupsResult> getGroups([String token]) async {
    var fromCache = await prefHelper.getCache(AppConstants.GROUPS);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return GroupsResult.fromJson(json);
    }
    return null;
  }

  @override
  Future<Result> updateGroup(
      [String token,
      int id,
      String name,
      int cityId,
      String startDate,
      String endDate]) {
    throw UnimplementedError();
  }

  /// User Details
  Future<bool> saveUsers(UsersResult result) {
    return prefHelper.storeCache(AppConstants.USERS, jsonEncode(result));
  }

  @override
  Future<UsersResult> getUsers([String token]) async {
    var fromCache = await prefHelper.getCache(AppConstants.USERS);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return UsersResult.fromJson(json);
    }
    return null;
  }

  Future<bool> saveCurrentUser(CurrentUserResult result) {
    return prefHelper.storePermanentCachePermanent(
        AppConstants.CURRENT_USER, jsonEncode(result));
  }

  @override
  Future<CurrentUserResult> getCurrentUser(
      [String token, bool isFromDio]) async {
    var fromCache =
        await prefHelper.getPermanentCachePermanent(AppConstants.CURRENT_USER);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return CurrentUserResult.fromJson(json);
    }
    return null;
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
    throw UnimplementedError();
  }

  /// Cities
  Future<bool> saveCities(CitiesResult result) {
    return prefHelper.storeCache(AppConstants.CITIES, jsonEncode(result));
  }

  @override
  Future<CitiesResult> getCities([String token]) async {
    var fromCache = await prefHelper.getCache(AppConstants.CITIES);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return CitiesResult.fromJson(json);
    }
    return null;
  }

  @override
  Future<CityResult> deleteCity([String token, int cityId]) {
    throw UnimplementedError();
  }
}
