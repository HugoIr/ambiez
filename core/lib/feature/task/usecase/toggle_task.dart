import 'package:core/error/failure.dart';
import 'package:core/feature/task/domain/task_data.dart';
import 'package:core/feature/task/impl/task.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ToggleTaskUseCase {
  final TaskRepository _repository;
  const ToggleTaskUseCase(this._repository);

  Future<Either<Failure, void>> execute(int taskId) {
    return _repository.toggleTask(taskId);
  }
}
