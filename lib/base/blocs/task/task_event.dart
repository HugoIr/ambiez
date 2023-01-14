part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class GetTaskAllEvent extends TaskEvent {}
