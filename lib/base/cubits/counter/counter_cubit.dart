import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void reset() {
    emit(0);
  }

  void add() {
    emit(state + 1);
  }
}
