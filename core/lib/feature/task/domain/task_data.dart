import 'package:core/api/task/response/task.dart';
import 'package:flutter/material.dart';

@immutable
class TaskData {
  final int id;
  final String title;
  final bool completed;
  final int hour;
  final int minute;

  const TaskData({
    required this.id,
    required this.title,
    required this.completed,
    required this.hour,
    required this.minute,
  });

  factory TaskData.fromResponse(TaskResponse? taskResponse) => TaskData(
        id: taskResponse?.id ?? 0,
        title: taskResponse?.title ?? "",
        completed: taskResponse?.completed ?? false,
        hour: taskResponse?.hour ?? 0,
        minute: taskResponse?.minute ?? 0,
      );
}
