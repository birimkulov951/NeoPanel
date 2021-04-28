import 'package:core/core.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:neopanel/ui/my_profile_page.dart';
import 'package:neopanel/ui/teachers/teacher_card_page.dart';
import 'package:neopanel/ui/authorization/authorization_page.dart';
import 'package:neopanel/ui/authorization/password_recovery_page.dart';
import 'package:neopanel/ui/leads/failure_lead_page.dart';
import 'package:neopanel/ui/leads/successful_lead_page.dart';
import 'package:neopanel/ui/employees/employees_page.dart';
import 'package:neopanel/ui/action_history_page.dart';
import 'package:neopanel/ui/archive/archive_group_students_page.dart';
import 'package:neopanel/ui/archive/archive_page.dart';
import 'package:neopanel/ui/leads/client_card_page.dart';
import 'package:neopanel/ui/leads/client_form_page.dart';
import 'package:neopanel/ui/employees/employee_form_page.dart';
import 'package:neopanel/ui/forms/course_form_page.dart';
import 'package:neopanel/ui/forms/group_form_page.dart';
import 'package:neopanel/ui/menu/waiting_list_page.dart';
import 'package:neopanel/ui/main_page.dart';
import 'package:neopanel/ui/notifications_page.dart';
import 'package:neopanel/ui/settings/cities_settings_page.dart';
import 'package:neopanel/ui/settings/city_form_page.dart';
import 'package:neopanel/ui/settings/settings_page.dart';
import 'package:neopanel/ui/splash_screen.dart';
import 'package:neopanel/ui/students/student_card_page.dart';
import 'package:neopanel/ui/students/student_form_page.dart';
import 'package:neopanel/ui/students/students_page.dart';
import 'package:neopanel/ui/teachers/teacher_form_page.dart';
import 'package:neopanel/ui/teachers/teachers_page.dart';
import 'package:neopanel/ui/leads/column_form_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthorizationBloc>(
          create: (context) => inject<AuthorizationBloc>(),
        ),
        BlocProvider<PasswordRecoveryBloc>(
          create: (context) => inject<PasswordRecoveryBloc>(),
        ),
        BlocProvider<LeadsBloc>(
          create: (context) => inject<LeadsBloc>(),
        ),
        BlocProvider<FailureLeadBloc>(
          create: (context) => inject<FailureLeadBloc>(),
        ),
        BlocProvider<SuccessfulLeadBloc>(
          create: (context) => inject<SuccessfulLeadBloc>(),
        ),
        BlocProvider<LeadDetailsBloc>(
          create: (context) => inject<LeadDetailsBloc>(),
        ),
        BlocProvider<StudentsBloc>(
          create: (context) => inject<StudentsBloc>(),
        ),
        BlocProvider<CourseBloc>(
          create: (context) => inject<CourseBloc>(),
        ),
        BlocProvider<StudentDetailsBloc>(
          create: (context) => inject<StudentDetailsBloc>(),
        ),
        BlocProvider<TeacherBloc>(
          create: (context) => inject<TeacherBloc>(),
        ),
        BlocProvider<TeacherDetailsBloc>(
          create: (context) => inject<TeacherDetailsBloc>(),
        ),
        BlocProvider<GroupBloc>(
          create: (context) => inject<GroupBloc>(),
        ),
        BlocProvider<CityBloc>(
          create: (context) => inject<CityBloc>(),
        ),
        BlocProvider<CurrentUserBloc>(
          create: (context) => inject<CurrentUserBloc>(),
        ),


        BlocProvider<ThemeBloc>(
          create: (context) => inject<ThemeBloc>(),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => inject<SplashBloc>(),
        ),
        BlocProvider<ActionHistoryBloc>(
          create: (context) => inject<ActionHistoryBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    context.select((ThemeBloc themeBloc) => themeBloc.add(GetTheme()));
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: state.isDarkTheme ? Themes.darkTheme : Themes.lightTheme,
      initialRoute: SplashScreen.routeName,

      // List all of the app's supported locales here
      supportedLocales: [
        Locale('ru', ''),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },

      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        MainPage.routeName: (context) => MainPage(),
        AuthorizationPage.routeName: (context) => AuthorizationPage(),
        ClientFormPage.routeName: (context) => ClientFormPage(),
        StudentsPage.routeName: (context) => StudentsPage(),
        ClientCardPage.routeName: (context) => ClientCardPage(),
        EmployeesPage.routeName: (context) => EmployeesPage(),
        TeachersPage.routeName: (context) => TeachersPage(),
        NotificationsPage.routeName: (context) => NotificationsPage(),
        WaitingListPage.routeName: (context) => WaitingListPage(),
        ArchivePage.routeName: (context) => ArchivePage(),
        SettingsPage.routeName: (context) => SettingsPage(),
        CitiesSettingsPage.routeName: (context) => CitiesSettingsPage(),
        MyProfilePage.routeName: (context) => MyProfilePage(),
        ArchiveGroupStudentsPage.routeName: (context) => ArchiveGroupStudentsPage(),
        SuccessfulLeadPage.routeName: (context) => SuccessfulLeadPage(),
        FailureLeadPage.routeName: (context) => FailureLeadPage(),
        TeacherFormPage.routeName: (context) => TeacherFormPage(),
        StudentFormPage.routeName: (context) => StudentFormPage(),
        StudentCardPage.routeName: (context) => StudentCardPage(),
        CityFormPage.routeName: (context) => CityFormPage(),
        CourseFormPage.routeName: (context) => CourseFormPage(),
        GroupFormPage.routeName: (context) => GroupFormPage(),
        EmployeeFormPage.routeName: (context) => EmployeeFormPage(),
        PasswordRecoveryPage.routeName: (context) => PasswordRecoveryPage(),
        TeacherCardPage.routeName: (context) => TeacherCardPage(),
        ColumnFormPage.routeName: (context) => ColumnFormPage(),



        // MainPage's Fragments.
        ActionHistoryPage.routeName: (context) => ActionHistoryPage(),
      },
    );
  }


}
