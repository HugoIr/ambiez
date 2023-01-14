import 'package:core/api/task/response/task.dart';
import 'package:core/api/task/task.dart';
import 'package:core/client/execute_api.dart';
import 'package:core/error/failure.dart';
import 'package:core/feature/task/domain/task_data.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class TaskRepository {
  final TaskApi _taskApi;
  const TaskRepository({
    required TaskApi taskApi,
  }) : _taskApi = taskApi;

  Future<Either<Failure, List<TaskData>>> getTaskAll() async {
    final result = await executeApi(_taskApi.getTaskAll());

    return result.fold(left, (r) {
      List<TaskData> taskData = [];

      for (TaskResponse response in r) {
        taskData.add(TaskData.fromResponse(response));
      }

      return right(taskData);
    });
  }

  Future<Either<Failure, TaskData>> getTaskById(int taskId) async {
    final result = await executeApi(_taskApi.getTaskById(taskId));

    return result.fold(left, (r) {
      return right(TaskData.fromResponse(r));
    });
  }
}
