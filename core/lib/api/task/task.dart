import 'package:core/api/task/request/task.dart';
import 'package:core/api/task/response/task.dart';
import 'package:core/client/api_dio.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'task.g.dart';

@RestApi()
abstract class TaskApi {
  factory TaskApi(ApiDio dio, {String baseUrl}) = _TaskApi;

  // Get all tasks
  @GET('/tasks')
  Future<List<TaskResponse>> getTaskAll();

  // Get task by ID
  @GET('/tasks/{task_id}')
  Future<TaskResponse> getTaskById(
    @Path('task_id') int taskId,
  );

  // Add task
  @POST('/tasks')
  Future<TaskResponse> addTask(
    @Body() TaskRequest taskRequest,
  );

  // Update task
  @PATCH('/tasks/{task_id}')
  Future<TaskResponse> updateTask(
    @Path('task_id') int taskId,
    @Body() TaskRequest taskRequest,
  );

  // Toggle task
  @PATCH('/tasks/toggle/{task_id}')
  Future<TaskResponse> toggleTask(
    @Path('task_id') int taskId,
  );

  // Remove task
  @DELETE('/tasks/{task_id}')
  Future<TaskResponse> removeTask(
    @Path('task_id') int taskId,
  );
}
