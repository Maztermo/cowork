import 'package:cowork/constants/app_colors.dart';
import 'package:cowork/constants/app_styles.dart';

import 'package:flutter/material.dart';

class TaskSizeSelectionPill extends StatelessWidget {
  final Color color;
  final String text;
  final bool selected;
  final Function function;

  const TaskSizeSelectionPill({
    Key? key,
    required this.color,
    required this.text,
    required this.selected,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      onTap: () {
        function();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        decoration: selected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(width: 1.5, color: AppColors.darkGreen))
            : null,
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: AppStyles.style5DarkGreen,
            ),
          ],
        ),
      ),
    );
  }
}
