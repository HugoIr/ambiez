import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class TaskResponse {
  final int id;
  final String title;
  final bool completed;
  final int hour;
  final int minute;

  TaskResponse(
    this.id,
    this.title,
    this.completed,
    this.hour,
    this.minute,
  );

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);
}
