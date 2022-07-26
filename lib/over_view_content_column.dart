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
                            const SizedBox(height: 40)
                          ],
                        );
                      })),
        ],
      ),
    );
  }
}

//  ListView(
//               children: const [
//                 TaskListTile(
//                     taskTitle: "Fixing discord bot reply bug",
//                     taskSize: TaskSize.small,
//                     username: "Dazinmatru"),
//                 SizedBox(height: 40),
//                 TaskListTile(
//                     taskTitle:
//                         "Last touches to design update that client has been nagging me about",
//                     taskSize: TaskSize.small,
//                     username: "Sleepy"),
//                 SizedBox(height: 40),
//                 TaskListTile(
//                     taskTitle: "Making a new and improved C++(ultra)",
//                     taskSize: TaskSize.large,
//                     username: "Jaycob"),
//                 SizedBox(height: 40),
//                 TaskListTile(
//                     taskTitle: "Cleaning up my kitchen",
//                     taskSize: TaskSize.small,
//                     username: "Maztermo"),
//                 SizedBox(height: 40),
//                 TaskListTile(
//                     taskTitle: "Taking over the company I'm working for",
//                     taskSize: TaskSize.medium,
//                     username: "Han"),
//                 SizedBox(height: 40),
//                 TaskListTile(
//                     taskTitle: "Fixing discord bot reply bug",
//                     taskSize: TaskSize.small,
//                     username: "Dazinmatru"),
//                 SizedBox(height: 40),
//                 TaskListTile(
//                     taskTitle:
//                         "Last touches to design update that client has been nagging me about",
//                     taskSize: TaskSize.small,
//                     username: "Sleepy"),
//                 SizedBox(height: 40),
//                 TaskListTile(
//                     taskTitle: "Making a new and improved C++(ultra)",
//                     taskSize: TaskSize.large,
//                     username: "Jaycob"),
//                 SizedBox(height: 40),
//                 TaskListTile(
//                     taskTitle: "Cleaning up my kitchen",
//                     taskSize: TaskSize.small,
//                     username: "Maztermo"),
//                 SizedBox(height: 40),
//                 TaskListTile(
//                     taskTitle: "Taking over the company I'm working for",
//                     taskSize: TaskSize.medium,
//                     username: "Han"),
//               ],
//             ),