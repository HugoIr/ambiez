import 'package:core/di/core_di.dart';

import 'flavor.dart';

class CoreConfig {
  static Flavor? appFlavor;

  static Future<void> init(
    Flavor flavor,
  ) async {
    appFlavor = flavor;

    await configureCoreDependencies();
  }

  static bool get isLocal => appFlavor == Flavor.local;
  static bool get isTesting => appFlavor == Flavor.testing;
  static bool get isStaging => appFlavor == Flavor.staging;
  static bool get isProduction => appFlavor == Flavor.production;
}
