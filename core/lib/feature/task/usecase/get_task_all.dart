import 'package:core/error/failure.dart';
import 'package:core/feature/task/domain/task_data.dart';
import 'package:core/feature/task/impl/task.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTaskAllUseCase {
  final TaskRepository _repository;
  GetTaskAllUseCase(this._repository);

  Future<Either<Failure, List<TaskData>>> execute() async {
    return _repository.getTaskAll();
  }
}
