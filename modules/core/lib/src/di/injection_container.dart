import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:core/core.dart';

final inject = GetIt.instance;

Future<void> init(String baseUrl) async {
  // BLoC
  inject.registerFactory(() => AuthorizationBloc(repository: inject()));
  inject.registerFactory(() => PasswordRecoveryBloc(repository: inject()));
  inject.registerFactory(() => LeadsBloc(repository: inject()));
  inject.registerFactory(() => FailureLeadBloc(repository: inject()));
  inject.registerFactory(() => SuccessfulLeadBloc(repository: inject()));
  inject.registerFactory(() => LeadDetailsBloc(repository: inject()));
  inject.registerFactory(() => StudentsBloc(repository: inject()));
  inject.registerFactory(() => CourseBloc(repository: inject()));
  inject.registerFactory(() => StudentDetailsBloc(repository: inject()));
  inject.registerFactory(() => TeacherBloc(repository: inject()));
  inject.registerFactory(() => TeacherDetailsBloc(repository: inject()));
  inject.registerFactory(() => GroupBloc(repository: inject()));
  inject.registerFactory(() => CityBloc(repository: inject()));
  inject.registerFactory(() => CurrentUserBloc(repository: inject()));


  inject.registerFactory(() => ThemeBloc(prefHelper: inject()));
  inject.registerFactory(() => SplashBloc(prefHelper: inject()));
  inject.registerFactory(() => ActionHistoryBloc(prefHelper: inject()));


  // Repository
  inject.registerLazySingleton<Repository>(() =>
      MainRepository(apiRepository: inject(), localRepository: inject()));
  inject.registerLazySingleton(() => LocalRepository(prefHelper: inject()));
  inject.registerLazySingleton(() => ApiRepository(apiService: inject()));

  // Local
  final preferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => preferences);
  inject.registerLazySingleton(() => SharedPrefHelper(preferences: inject()));

  // Network
  inject.registerLazySingleton(() => ApiService(dio: inject()));
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton(() => DioClient(apiBaseUrl: baseUrl));
}
