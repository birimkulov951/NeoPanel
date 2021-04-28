import 'package:core/core.dart';

abstract class Repository {
  /* Future<void> saveLeadStatusesToLocal([StatusesResult data]);
  Future<void> saveLeadsToLocal(LeadsResult data);
  Future<StatusesResult> getLeadStatusesFromLocal();
  Future<LeadsResult> getLeadsFromLocal();*/

  /// Authorization
  Future<AuthorizationResult> authorize(
      [String email, String password, bool isRememberMe]);
  Future<GenerateForgotPasswordResult> generateForgotPasswordCode(
      [String email]);
  Future<GenerateNewPasswordResult> generateNewPassword(
      [int code, String email]);

  /// Lead Status
  Future<StatusesResult> getLeadStatuses([String token]);

  /// Leads
  Future<Result> createLead([String token]);
  Future<LeadsResult> getLeadsByIndexes([String token, bool isFromDio]);
  Future<LeadDetailsResult> getLeadDetails([String token, int leadId]);
  Future<Result> updateLead([String token]);
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
      int leadFailureStatusId]);
  Future<Result> updateLeadStatus([String token, int leadId, int leadStatusId]);
  Future<Result> deleteLead(String token, int leadId);

  /// Courses
  Future<Result> createCourse(
      [String token, String name, int cityId, int teacherId, String color]);
  Future<CoursesResult> getCourses([String token]);
  Future<CourseDetailsResult> getCourseDetails([String token, int courseId]);
  Future<Result> updateCourse(
      [String token,
      int id,
      String name,
      int cityId,
      int teacherId,
      String color]);
  Future<Result> deleteCourse([String token, courseId]);

  /// Students
  Future<Result> createStudent([String token, int leadId, int groupId]);
  Future<StudentsResult> getStudents([String token]);
  Future<StudentDetailsResult> getStudentDetails([String token, int studentId]);
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
      String discriminator]);
  Future<Result> deleteStudent([String token, studentId]);

  /// Teachers
  Future<Result> createTeacher(
      [String token,
      int id,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phone]);
  Future<TeachersResult> getTeachers([String token]);
  Future<TeacherDetailsResult> getTeacherDetails([String token, int teacherId]);
  Future<Result> updateTeacher(
      [String token,
      int id,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phone]);
  Future<Result> deleteTeacher([String token, teacherId]);

  /// Groups
  Future<Result> createGroup(
      [String token,
      String name,
      int courseId,
      String startDate,
      String endDate]);
  Future<GroupsResult> getGroups([String token]);
  Future<GroupDetailsResult> getGroupDetails([String token, int groupId]);
  Future<Result> updateGroup(
      [String token,
      int id,
      String name,
      int cityId,
      String startDate,
      String endDate]);
  Future<Result> deleteGroup([String token, int groupId]);

  /// User Details
  Future<UsersResult> getUsers([String token]);
  Future<CurrentUserResult> getCurrentUser([String token, bool isFromDio]);
  Future<AuthorizationResult> updateUser(
      [String token,
      int id,
      String username,
      String surname,
      String name,
      String middleName,
      int cityId,
      String phoneNumber,
      String email]);

  /// Cities
  Future<CitiesResult> getCities([String token]);
  Future<CityResult> deleteCity([String token, int cityId]);
}
