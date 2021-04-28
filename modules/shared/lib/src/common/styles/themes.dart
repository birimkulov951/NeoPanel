import 'package:flutter/material.dart';

import 'color_palettes.dart';

class Themes {
  /// This widget is the root of your application.
  ///    @override
  ///    Widget build(BuildContext context) {
  ///    return MaterialApp(
  ///    title: 'Neo Panel',
  ///    theme: ThemeData(
  ///    primaryColor: Colors.deepPurple,
  ///    primarySwatch: Colors.deepPurple,
  ///    accentColor: Colors.deepPurple,
  ///    visualDensity: VisualDensity.adaptivePlatformDensity,
  ///    unselectedWidgetColor: Colors.lightGreen,
  ///    scaffoldBackgroundColor: Colors.white,
  ///    ),
  ///    // List all of the app's supported locales here
  ///    supportedLocales: [
  ///    Locale('ru', ''),
  ///    ],
  ///    // These delegates make sure that the localization data for the proper language is loaded
  ///    localizationsDelegates: [
  ///    // THIS CLASS WILL BE ADDED LATER
  ///    // A class which loads the translations from JSON files
  ///    AppLocalizations.delegate,
  ///    // Built-in localization of basic text for Material widgets
  ///    GlobalMaterialLocalizations.delegate,
  ///    // Built-in localization for text direction LTR/RTL
  ///    GlobalWidgetsLocalizations.delegate,
  ///    ],
  ///    // Returns a locale which will be used by the app
  ///    localeResolutionCallback: (locale, supportedLocales) {
  ///    // Check if the current device locale is supported
  ///    for (var supportedLocale in supportedLocales) {
  ///    if (supportedLocale.languageCode == locale.languageCode &&
  ///    supportedLocale.countryCode == locale.countryCode) {
  ///    return supportedLocale;
  ///    }
  ///    }
  ///    // If the locale of the device is not supported, use the first one
  ///    // from the list (English, in this case).
  ///    return supportedLocales.first;
  ///    },
  ///
  ///    //home: MyHomePage(),
  ///    //home: AutorizationPage(),
  ///    //routes: {'/registrationPage': (_) => RegistrationPage()});
  ///
  ///    initialRoute: prefs.getAuthToken() != null
  ///    ? AppConstants.AUTHORIZATION_PAGE
  ///    : AppConstants.HOME_PAGE,
  ///    onGenerateRoute: RouteGenerator.generateRoute,
  ///    );
  /// }
  ///

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Golos',
    backgroundColor: ColorPalettes.lightBG,
    primaryColor: ColorPalettes.lightPrimary,
    accentColor: ColorPalettes.lightAccent,
    //cursorColor: ColorPalettes.lightAccent,
    dividerColor: ColorPalettes.darkBG,
    scaffoldBackgroundColor: ColorPalettes.lightBG,
    //primarySwatch: Colors.deepPurple,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: ColorPalettes.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Golos',
    brightness: Brightness.dark,
    backgroundColor: ColorPalettes.darkBG,
    primaryColor: ColorPalettes.darkPrimary,
    accentColor: ColorPalettes.darkAccent,
    dividerColor: ColorPalettes.lightPrimary,
    scaffoldBackgroundColor: ColorPalettes.darkBG,
    //cursorColor: ColorPalettes.darkAccent,
    appBarTheme: AppBarTheme(
      color: ColorPalettes.darkPrimary,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: ColorPalettes.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
