import 'package:shared/shared.dart';

enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

class Config {
  static Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return AppConstants.appName;
      case Flavor.DEVELOPMENT:
      default:
        return AppConstants.appNameDev;
    }
  }

  static bool get isDebug {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return false;
      case Flavor.DEVELOPMENT:
      default:
        return true;
    }
  }
}
