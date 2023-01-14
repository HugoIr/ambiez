part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class GetTaskAllEvent extends TaskEvent {
  final GetTaskAllType getTaskAllType;
  GetTaskAllEvent({this.getTaskAllType = GetTaskAllType.all});
}

class AddTaskAllEvent extends TaskEvent {
  final TaskRequest taskRequest;
  AddTaskAllEvent({required this.taskRequest});
}

class ToggleTaskEvent extends TaskEvent {
  final int taskId;
  ToggleTaskEvent({required this.taskId});
}
