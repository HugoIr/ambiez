import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class TaskRequest {
  final String? title;
  final bool? completed;
  final int? hour;
  final int? minute;

  TaskRequest({
    this.title,
    this.completed,
    this.hour,
    this.minute,
  });

  factory TaskRequest.fromJson(Map<String, dynamic> json) =>
      _$TaskRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TaskRequestToJson(this);
}
