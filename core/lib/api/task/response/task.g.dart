// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskResponse _$TaskResponseFromJson(Map<String, dynamic> json) => TaskResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
      hour: json['hour'] as int,
      minute: json['minute'] as int,
    );

Map<String, dynamic> _$TaskResponseToJson(TaskResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
      'hour': instance.hour,
      'minute': instance.minute,
    };
