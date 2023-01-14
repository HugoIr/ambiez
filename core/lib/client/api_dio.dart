import 'package:core/config/config.dart';
import 'package:core/config/flavor.dart';
import 'package:dio/native_imp.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiDio extends DioForNative {
  ApiDio() {
    _configureOptions();
  }

  void _configureOptions() {
    switch (CoreConfig.appFlavor ?? Flavor.local) {
      case Flavor.local:
        options.baseUrl = 'http://10.0.2.2:9000';
        break;
      case Flavor.testing:
        options.baseUrl = 'http://10.0.2.2:9000';
        break;
      case Flavor.staging:
        options.baseUrl = 'http://10.0.2.2:9000';
        break;
      case Flavor.production:
        options.baseUrl = 'http://10.0.2.2:9000';
        break;
    }
  }
}
