import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';

class ApiService {

  /*BaseOptions options = new BaseOptions(
    baseUrl: "https://testcmsdeploy.herokuapp.com/",
    connectTimeout: 6000,
    receiveTimeout: 3000,
  );*/

  final Dio dio;
  ApiService({@required this.dio});

  /// Authorization
  Future<AuthorizationResult> authorize(String email, String password) async {
    try {
      final response = await dio.post("authenticate/login", data: Authorization(email,password) /*data: {'email':email, 'password':password}*/);

      return AuthorizationResult.fromJson(response.data);

    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<GenerateForgotPasswordResult> generateForgotPasswordCode(String email) async {
    try {
      final response = await dio.post("authenticate/geerateForgotPasswordCode", data: GenerateForgotPassword(email));

      return GenerateForgotPasswordResult.fromJson(response.data);

    } on DioError catch (e) {
      return e.error;
    }

  }

  Future<GenerateNewPasswordResult> generateNewPassword(int code, String email) async {
    try {
      final response = await dio.post("authenticate/generateNewPassword",
          data: GenerateNewPassword(code, email));

      return GenerateNewPasswordResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  /// Lead Status
  Future<StatusesResult> getLeadStatuses(String token) async {
    try {
      final response = await dio.get("LeadStatus/index", options: Options(headers: {'Authorization': 'Bearer $token'}));

      return StatusesResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  /// Leads
  Future<Result> createLead(String token) async {
    try {
      final response = await dio.post("lead/create", options: Options(headers: {'Authorization':'Bearer $token'}));

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<LeadsResult> getLeadsByIndexes(String token) async {
    try {
      final response = await dio.get("lead/index", options: Options(headers: {'Authorization':'Bearer $token'}));

      return LeadsResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<LeadDetailsResult> getLeadDetails(String token, int leadId) async {
    try {
      //dio.options.headers['content-Type'] = 'application/json';
      //dio.options.headers['accept'] = '*/*';
      //dio.options.headers["authorization"] = "token ${token}";
      final response = await dio.get("lead/details", queryParameters: {"id": leadId}, options: Options(headers: {'Authorization':'Bearer $token'}));

      return LeadDetailsResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> updateLead(String token, int id, String surname, String name, String middleName, int cityId, String phone, int courseId, int leadStatusId, String flexById, int leadFailureStatusId) async {
    try {
      final response = await dio.put("lead/update", options: Options(headers: {'Authorization':'Bearer $token'}), data: UpdateLead(id, surname, name, middleName, cityId, phone, courseId, leadStatusId, flexById, leadFailureStatusId));

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> leadFailure(String token, int id, String surname, String name, String middleName, int cityId, String phone, int courseId, int leadStatusId, String flexById, int leadFailureStatusId) async {
    try {
      final response = await dio.put("lead/leadFailure", options: Options(headers: {'Authorization':'Bearer $token'}), data: UpdateLead(id, surname, name, middleName, cityId, phone, courseId, leadStatusId, flexById, leadFailureStatusId));

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> updateLeadStatus(String token, int leadId, int leadStatusId) async {
    try {
      final response = await dio.put(
          "lead/updateStatus",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          data: {"id": leadId, "leadStatusId": leadStatusId}
          );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> deleteLead(String token, int leadId) async {
    try {
      final response = await dio.delete(
          "lead/delete",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          queryParameters: {"id": leadId}
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }



  /// Courses
  Future<Result> createCourse(String token, String name, int cityId, int teacherId, String color) async {
    try {
      final response = await dio.post(
          "course/create",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          data: CreateCourse(name, cityId, teacherId, color)
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<CoursesResult> getCourses(String token) async {
    try {
      final response = await dio.get("course/index", options: Options(headers: {'Authorization':'Bearer $token'}));

      return CoursesResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<CourseDetailsResult> getCourseDetails(String token, int courseId) async {
    try {
      final response = await dio.get("course/details", options: Options(headers: {'Authorization':'Bearer $token'}), queryParameters: {"id": courseId});

      return CourseDetailsResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> updateCourse(String token, int id, String name, int cityId, int teacherId, String color) async {
    try {
      final response = await dio.put(
          "course/update",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          data: UpdateCourse(id, name, cityId, teacherId, color)
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> deleteCourse(String token, int courseId) async {
    try {
      final response = await dio.delete(
          "course/delete",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          queryParameters: {"id": courseId}
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  /// Students
  Future<Result> createStudent(String token, int leadId, int groupId) async {
    try {
      final response = await dio.post(
          "student/create",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          data: {"leadId": leadId, "groupId": groupId}
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<StudentsResult> getStudents(String token) async {
    try {
      final response = await dio.get("student/index", options: Options(headers: {'Authorization':'Bearer $token'}));

      return StudentsResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<StudentDetailsResult> getStudentDetails(String token, int studentId) async {
    try {
      final response = await dio.get("student/details", options: Options(headers: {'Authorization':'Bearer $token'}), queryParameters: {"id": studentId});

      return StudentDetailsResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> updateStudent(String token, int id, String surname, String name, String middleName, int cityId, String phone, int groupId, String email, String address, bool hasLaptop, String discriminator) async {
    try {
      final response = await dio.put(
          "student/update",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          data: UpdateStudent(id, surname, name, middleName, cityId, phone, groupId, email, address, hasLaptop, discriminator)
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> deleteStudent(String token, int studentId) async {
    try {
      final response = await dio.delete(
          "student/delete",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          queryParameters: {"id": studentId}
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  /// Teachers
  Future<Result> createTeacher(String token, int id, String surname, String name, String middleName, int cityId, String phone) async {
    try {
      final response = await dio.post(
          "teacher/create",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          data: CreateTeacher(id, surname, name, middleName, cityId, phone)
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<TeachersResult> getTeachers(String token) async {
    try {
      final response = await dio.get("teacher/index", options: Options(headers: {'Authorization':'Bearer $token'}));

      return TeachersResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<TeacherDetailsResult> getTeacherDetails(String token, int teacherId) async {
    try {
      final response = await dio.get("teacher/details", options: Options(headers: {'Authorization':'Bearer $token'}), queryParameters: {"id": teacherId});

      return TeacherDetailsResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> updateTeacher(String token, int id, String surname, String name, String middleName, int cityId, String phone) async {
    try {
      final response = await dio.put(
          "teacher/update",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          data: UpdateTeacher(id, surname, name, middleName, cityId, phone)
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> deleteTeacher(String token, int teacherId) async {
    try {
      final response = await dio.delete(
          "teacher/delete",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          queryParameters: {"id": teacherId}
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }


  /// Groups
  Future<Result> createGroup(String token, String name, int courseId, String startDate, String endDate) async {
    try {
      final response = await dio.post(
          "group/create",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          data: CreateGroup(name, courseId, startDate, endDate)
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<GroupsResult> getGroups(String token) async {
    try {
      final response = await dio.get("group/index", options: Options(headers: {'Authorization':'Bearer $token'}));

      return GroupsResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<GroupDetailsResult> getGroupDetails(String token, int groupId) async {
    try {
      final response = await dio.get("group/details", options: Options(headers: {'Authorization':'Bearer $token'}), queryParameters: {"id": groupId});

      return GroupDetailsResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> updateGroup(String token, int id, String name, int cityId, String startDate, String endDate) async {
    try {
      final response = await dio.put(
          "group/update",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          data: UpdateGroup(id, name, cityId, startDate, endDate)
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<Result> deleteGroup(String token, int groupId) async {
    try {
      final response = await dio.delete(
          "group/delete",
          options: Options(headers: {'Authorization':'Bearer $token'}),
          queryParameters: {"id": groupId}
      );

      return Result.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }





  /// User Details
  Future<UsersResult> getUsers(String token) async {
    try {
      final response = await dio.get("user/indexfilter", options: Options(headers: {'Authorization':'Bearer $token'}));

      return UsersResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
  Future<CurrentUserResult> getCurrentUser(String token) async {
    try {
      final response = await dio.get("user/getUser", options: Options(headers: {'Authorization':'Bearer $token'}));

      return CurrentUserResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<AuthorizationResult> updateUser(String token, int id, String username, String surname, String name, String middleName, int cityId, String phoneNumber, String email) async {
    try {
      final response = await dio.put("user/Update", data: UpdateCurrentUser(id, username, surname, name, middleName, cityId, phoneNumber, email), options: Options(headers: {'Authorization':'Bearer $token'}));

      return AuthorizationResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
  Future<UsersResult> getUsersFilter(String token) async {
    try {
      final response = await dio.get("user/indexFilter", options: Options(headers: {'Authorization':'Bearer $token'}));

      return UsersResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }




  /// Cities
  Future<CitiesResult> getCities(String token) async {
    try {
      final response = await dio.get("city/index", options: Options(headers: {'Authorization':'Bearer $token'}));

      return CitiesResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  Future<CityResult> deleteCity(String token, int cityId) async {
    try {
      final response = await dio.delete("city/delete", queryParameters: {"id": cityId}, options: Options(headers: {'Authorization':'Bearer $token'}));

      return CityResult.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }


}
