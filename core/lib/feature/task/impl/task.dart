import 'package:core/api/task/request/task.dart';
import 'package:core/api/task/response/task.dart';
import 'package:core/api/task/task.dart';
import 'package:core/client/execute_api.dart';
import 'package:core/error/failure.dart';
import 'package:core/feature/task/domain/task_data.dart';
import 'package:core/feature/task/impl/get_all_type.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class TaskRepository {
  final TaskApi _taskApi;
  const TaskRepository({
    required TaskApi taskApi,
  }) : _taskApi = taskApi;

  Future<Either<Failure, List<TaskData>>> getTaskAll(
      GetTaskAllType getTaskAllType) async {
    final Either<Failure, List<TaskResponse>> result;
    switch (getTaskAllType) {
      case GetTaskAllType.todo:
        result = await executeApi(_taskApi.getTodoTaskAll());
        break;
      case GetTaskAllType.completed:
        result = await executeApi(_taskApi.getCompletedTaskAll());
        break;
      default:
        result = await executeApi(_taskApi.getTaskAll());
        break;
    }

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

  Future<Either<Failure, void>> toggleTask(int taskId) async {
    final result = await executeApi(_taskApi.toggleTask(taskId));

    return result.fold(left, right);
  }

  Future<Either<Failure, TaskData>> addTask(TaskRequest taskRequest) async {
    final result = await executeApi(_taskApi.addTask(taskRequest));

    return result.fold(left, (r) {
      return right(TaskData.fromResponse(r));
    });
  }
}
