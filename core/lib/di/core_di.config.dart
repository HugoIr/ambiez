// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/api/task/task.dart' as _i4;
import 'package:core/client/api_dio.dart' as _i3;
import 'package:core/feature/task/impl/task.dart' as _i5;
import 'package:core/feature/task/usecase/add_task.dart' as _i7;
import 'package:core/feature/task/usecase/get_task_all.dart' as _i8;
import 'package:core/feature/task/usecase/get_task_by_id.dart' as _i9;
import 'package:core/feature/task/usecase/toggle_task.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/task/retrofit_module.dart' as _i10;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initCoreGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final retrofitInjectableModule = _$RetrofitInjectableModule();
  gh.factory<_i3.ApiDio>(() => _i3.ApiDio());
  gh.factory<_i4.TaskApi>(
      () => retrofitInjectableModule.getService(gh<_i3.ApiDio>()));
  gh.factory<_i5.TaskRepository>(
      () => _i5.TaskRepository(taskApi: gh<_i4.TaskApi>()));
  gh.factory<_i6.ToggleTaskUseCase>(
      () => _i6.ToggleTaskUseCase(gh<_i5.TaskRepository>()));
  gh.factory<_i7.AddTaskUseCase>(
      () => _i7.AddTaskUseCase(gh<_i5.TaskRepository>()));
  gh.factory<_i8.GetTaskAllUseCase>(
      () => _i8.GetTaskAllUseCase(gh<_i5.TaskRepository>()));
  gh.factory<_i9.GetTaskByIdUseCase>(
      () => _i9.GetTaskByIdUseCase(gh<_i5.TaskRepository>()));
  return getIt;
}

class _$RetrofitInjectableModule extends _i10.RetrofitInjectableModule {}
