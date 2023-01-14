import 'package:core/di/core_di.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies() async => $initGetIt(
      getIt,
    );
