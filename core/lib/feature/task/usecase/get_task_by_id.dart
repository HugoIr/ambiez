import 'package:core/error/failure.dart';
import 'package:core/feature/task/domain/task_data.dart';
import 'package:core/feature/task/impl/task.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTaskByIdUseCase {
  final TaskRepository _repository;
  const GetTaskByIdUseCase(this._repository);

  Future<Either<Failure, TaskData>> execute(int taskId) {
    return _repository.getTaskById(taskId);
  }
}
