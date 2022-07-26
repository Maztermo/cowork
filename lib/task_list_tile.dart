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
    Color pillColor = const Color(0xFF84A98C);
    switch (taskSize) {
      case "small":
        pillColor = const Color(0xFF84A98C);
        break;
      case "medium":
        pillColor = const Color.fromARGB(255, 135, 174, 232);
        break;
      case "large":
        pillColor = const Color(0xFFBA8446);
        break;

      default:
        pillColor = const Color(0xFF84A98C);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      constraints: const BoxConstraints(maxWidth: 1200),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkGreen, width: 5),
      ),
      child: Center(
        child: Row(
          children: [
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
                width: 340,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Task size pill
                    Container(
                      width: 124,
                      height: 34,
                      decoration: BoxDecoration(
                        color: pillColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          taskSize,
                          style: AppStyles.style5WhiteGreen,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // User name
                    Text(username, style: AppStyles.style4darkGreen),
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
