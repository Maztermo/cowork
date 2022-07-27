import 'package:cowork/constants/app_colors.dart';
import 'package:cowork/constants/app_styles.dart';
import 'package:cowork/models/task.dart';
import 'package:cowork/providers/tasks/tasks_provider.dart';
import 'package:cowork/task_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverViewContentColumn extends ConsumerWidget {
  const OverViewContentColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> tasks = ref.watch(tasksProvider).tasks;

    return Padding(
      padding: const EdgeInsets.only(left: 80.0, top: 64, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What's\nbeing\nworked on.",
            style: AppStyles.style2darkGreen,
          ),
          const SizedBox(height: 40),
          (tasks.isEmpty)
              ? Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 80),
                    height: 44,
                    width: 44,
                    child: const CircularProgressIndicator(
                      color: AppColors.darkGreen,
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        Task task = tasks[index];
                        return Column(
                          children: [
                            TaskListTile(
                              taskTitle: task.taskText,
                              taskSize: task.taskSize,
                              username: task.userName,
                            ),
                            const SizedBox(height: 30)
                          ],
                        );
                      })),
        ],
      ),
    );
  }
}
