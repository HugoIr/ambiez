import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ToggleCubit extends Cubit<bool> {
  ToggleCubit() : super(false);

  void toggle() {
    emit(!state);
  }
}
