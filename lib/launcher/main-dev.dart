import 'package:core/core.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart' as di;

import 'app_config.dart';
import 'neopanel_app.dart';

void main() async {
  Bloc.observer = NeoPanelBlocObserver();
  Config.appFlavor = Flavor.DEVELOPMENT;
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(ApiConstants.baseUrl);

  // Disabled Landscape mode code
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Status bar colors
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
  ));

  runApp(MyApp());
}
