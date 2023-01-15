// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ambiez/base/blocs/task/task_bloc.dart' as _i4;
import 'package:ambiez/base/cubits/counter/counter_cubit.dart' as _i3;
import 'package:ambiez/base/cubits/toggle/toggle_cubit.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.CounterCubit>(_i3.CounterCubit());
  gh.singleton<_i4.TaskBloc>(_i4.TaskBloc());
  gh.singleton<_i5.ToggleCubit>(_i5.ToggleCubit());
  return getIt;
}
