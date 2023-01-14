import 'package:core/api/task/task.dart';
import 'package:core/client/api_dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RetrofitInjectableModule {
  TaskApi getService(ApiDio client) => TaskApi(client);
}
