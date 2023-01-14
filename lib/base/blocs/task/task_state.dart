part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskAllLoaded extends TaskState {
  final List<TaskData> tasksData;
  TaskAllLoaded({required this.tasksData});
}

class TaskError extends TaskState {
  final Failure failure;
  TaskError({required this.failure});
}
