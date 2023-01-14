// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskRequest _$TaskRequestFromJson(Map<String, dynamic> json) => TaskRequest(
      json['title'] as String?,
      json['completed'] as bool?,
      json['hour'] as int?,
      json['minute'] as int?,
    );

Map<String, dynamic> _$TaskRequestToJson(TaskRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'completed': instance.completed,
      'hour': instance.hour,
      'minute': instance.minute,
    };
