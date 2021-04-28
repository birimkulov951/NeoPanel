import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPrefHelper prefHelper;

  ThemeBloc({@required this.prefHelper})
      : super(ThemeState(isDarkTheme: false));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      await prefHelper.saveValueDarkTheme(event.isDarkTheme);
      yield ThemeState(isDarkTheme: event.isDarkTheme);
    } else if (event is GetTheme) {
      var isDarkTheme = await prefHelper.getValueDarkTheme();
      yield ThemeState(isDarkTheme: isDarkTheme);
    }
  }
}
