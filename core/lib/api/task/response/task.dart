import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class TaskResponse {
  final int id;
  final String title;
  final bool completed;
  final int hour;
  final int minute;

  TaskResponse({
    required this.id,
    required this.title,
    required this.completed,
    required this.hour,
    required this.minute,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);
}
