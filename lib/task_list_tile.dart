import 'package:cowork/constants/app_colors.dart';
import 'package:cowork/constants/app_styles.dart';
import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    Key? key,
    required this.taskTitle,
    required this.taskSize,
    required this.username,
  }) : super(key: key);

  final String taskTitle;
  final String taskSize;
  final String username;

  @override
  Widget build(BuildContext context) {
    // Default as green
    Color pillColor = AppColors.smallPill;
    if (taskSize == 'large') pillColor = AppColors.largePill;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      constraints: const BoxConstraints(maxWidth: 1200),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkGreen, width: 2.5),
      ),
      child: Center(
        child: Row(
          children: [
            // Task size pill
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: pillColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                // TODO: add a if more than x chars then add ... manually to avoid elipsis bug
                taskTitle,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: AppStyles.style4darkGreen,
              ),
            ),

            // Username + Icon
            SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // User name
                    SizedBox(
                      width: 100,
                      child: FittedBox(
                          child:
                              Text(username, style: AppStyles.style4darkGreen)),
                    ),
                    const SizedBox(width: 16),
                    // Icon
                    const Icon(
                      Icons.person,
                      color: AppColors.darkGreen,
                      size: 44,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
