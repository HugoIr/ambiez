import 'package:bloc/bloc.dart';

class ToggleCubit extends Cubit<bool> {
  ToggleCubit([bool initialValue = false]) : super(initialValue);

  void toogle() {
    emit(!state);
  }
}
