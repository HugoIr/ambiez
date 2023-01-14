import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'core_di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initCoreGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureCoreDependencies({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async =>
    $initCoreGetIt(
      getIt,
      environment: environment,
      environmentFilter: environmentFilter,
    );
