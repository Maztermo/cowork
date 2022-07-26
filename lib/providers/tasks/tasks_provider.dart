import 'package:cowork/models/task.dart';
import 'package:cowork/providers/tasks/tasks_state.dart';
import 'package:cowork/repositories/task_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tasksProvider = StateNotifierProvider<TasksController, TasksState>((ref) {
  return TasksController(TasksState(tasks: []));
});

class TasksController extends StateNotifier<TasksState> {
  TasksController(
    TasksState state,
  ) : super(state) {
    downloadTasks();
  }

  final taskRepo = TaskRepository();
  downloadTasks() async {
    List<Task> tasks = await taskRepo.getTasks();
    state = state.copyWith(tasks: tasks);
  }

  uploadTask(Task newTask) async {
    await taskRepo.uploadTask(task: newTask);
    downloadTasks(); // to keep it all updated
  }

  updateTask(Task updatedTask, String id) async {
    await taskRepo.updateTask(task: updatedTask, id: id);
    downloadTasks(); // to keep it all updated
  }

  deleteTask(String id) async {
    await taskRepo.deleteTask(id: id);
    downloadTasks();
  }
}
