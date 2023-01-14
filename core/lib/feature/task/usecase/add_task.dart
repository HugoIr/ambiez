import 'package:core/api/task/request/task.dart';
import 'package:core/error/failure.dart';
import 'package:core/feature/task/domain/task_data.dart';
import 'package:core/feature/task/impl/task.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddTaskUseCase {
  final TaskRepository _repository;
  const AddTaskUseCase(this._repository);

  Future<Either<Failure, TaskData>> execute(TaskRequest taskRequest) {
    return _repository.addTask(taskRequest);
  }
}
