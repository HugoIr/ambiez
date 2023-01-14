import 'package:bloc/bloc.dart';
import 'package:core/feature/task/domain/task_data.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:core/feature/task/usecase/get_task_all.dart';
import 'package:core/di/core_di.dart';

part 'task_event.dart';
part 'task_state.dart';

@singleton
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final _getTaskUseCase = getIt<GetTaskAllUseCase>();
  TaskBloc() : super(TaskInitial()) {
    on<GetTaskAllEvent>(_onGetTaskAll);
  }

  void _onGetTaskAll(GetTaskAllEvent event, Emitter<TaskState> emit) async {
    final result = await _getTaskUseCase.execute();
    result.fold(
      (l) {
        emit(TaskError(message: "[Task Bloc]: " + l.toString()));
      },
      (r) {
        // print("R bloc : ${r.length}");
        emit(TaskAllLoaded(tasksData: r));
      },
    );
  }
}
