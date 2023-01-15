// import 'package:bloc/bloc.dart';
// import 'package:core/api/task/request/task.dart';
// import 'package:core/error/failure.dart';
// import 'package:core/feature/task/domain/task_data.dart';
// import 'package:core/feature/task/impl/get_all_type.dart';
// import 'package:core/feature/task/usecase/add_task.dart';
// import 'package:core/feature/task/usecase/toggle_task.dart';
// import 'package:injectable/injectable.dart';
// import 'package:meta/meta.dart';
// import 'package:core/feature/task/usecase/get_task_all.dart';
// import 'package:core/di/core_di.dart';

// part 'task_event.dart';
// part 'task_state.dart';

// @singleton
// class TaskBloc extends Bloc<TaskEvent, TaskState> {
//   final _getTaskAllUseCase = getIt<GetTaskAllUseCase>();
//   final _addTaskUseCase = getIt<AddTaskUseCase>();
//   final _toggleTaskUseCase = getIt<ToggleTaskUseCase>();

//   TaskBloc() : super(TaskInitial()) {
//     on<GetTaskAllEvent>(_onGetTaskAll);
//     on<AddTaskAllEvent>(_onAddTask);
//     on<ToggleTaskEvent>(_onToggleTask);
//   }

//   void _onGetTaskAll(GetTaskAllEvent event, Emitter<TaskState> emit) async {
//     final resultTodo = await _getTaskAllUseCase.execute(event.getTaskAllType);
//     result.fold(
//       (l) {
//         emit(
//           TaskError(failure: l),
//         );
//       },
//       (r) {
//         emit(
//           TaskAllLoaded(tasksData: r),
//         );
//       },
//     );
//   }

//   void _onAddTask(AddTaskAllEvent event, Emitter<TaskState> emit) async {
//     final result = await _addTaskUseCase.execute(event.taskRequest);
//     result.fold(
//       (l) {
//         emit(
//           TaskError(failure: l),
//         );
//       },
//       (r) {
//         final state = this.state;
//         if (state is TaskAllLoaded) {
//           state.tasksData.insert(0, r);
//           emit(TaskAllLoaded(tasksData: state.tasksData));
//         }
//       },
//     );
//   }

//   void _onToggleTask(ToggleTaskEvent event, Emitter<TaskState> emit) async {
//     final result = await _toggleTaskUseCase.execute(event.taskId);
//     result.fold(
//       (l) {
//         emit(
//           TaskError(failure: l),
//         );
//       },
//       (r) {
//         final state = this.state;
//         if (state is TaskAllLoaded) {
//           List<TaskData> sourceList;
//           List<TaskData> destList;

//           if (event.currentStatus) {
//             sourceList = state.tasksCompletedData;
//             destList = state.tasksTodoData;
//           } else {
//             sourceList = state.tasksTodoData;
//             destList = state.tasksCompletedData;
//           }

//           TaskData taskData;
//           for (int i = 0; i < sourceList.length; i++) {
//             taskData = sourceList[i];
//             if (taskData.id == event.taskId) {
//               taskData.completed = !taskData.completed;

//               destList.add(taskData);
//               sourceList.removeAt(i);
//               break;
//             }
//           }

//           emit(TaskAllLoaded(
//             tasksTodoData: state.tasksTodoData,
//             tasksCompletedData: state.tasksCompletedData,
//           ));
//         }
//       },
//     );
//   }
// }
