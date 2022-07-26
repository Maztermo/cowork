import 'package:cowork/models/task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class TasksState extends Equatable {
  final List<Task> tasks;

  const TasksState({required this.tasks});

  TasksState copyWith({
    List<Task>? tasks,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [
        tasks,
      ];
}
