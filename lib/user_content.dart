import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cowork/constants/app_colors.dart';
import 'package:cowork/constants/app_styles.dart';
import 'package:cowork/models/task.dart';
import 'package:cowork/providers/tasks/tasks_provider.dart';
import 'package:cowork/providers/user/user_provider.dart';
import 'package:cowork/repositories/user_repository.dart';

import 'package:cowork/task_size_selection_pill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserContent extends ConsumerStatefulWidget {
  const UserContent({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<UserContent> createState() => _UserContentState();
}

class _UserContentState extends ConsumerState<UserContent> {
  var userName = "loading...";
  var editName = false;
  var taskSize = 'small';
  var userNameController = TextEditingController();
  var taskTextController = TextEditingController();

  void showSnackBarMessage(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: AppStyles.style5WhiteThin,
    )));
  }

  void selectTaskSize({required String size}) {
    setState(() {
      taskSize = size;
    });

    print(taskSize);
  }

  @override
  void dispose() {
    userNameController.dispose();
    taskTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getUserNameOnce();
    super.initState();
  }

  Future getUserNameOnce() async {
    userName = await UserRepository().getUserName();
    setState(() {});
    userNameController.text = userName;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80.0, top: 64, right: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          (editName)
              ? Row(
                  children: [
                    Text(
                      "Welcome",
                      style: AppStyles.style2darkGreen,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Focus(
                        child: TextField(
                            style: AppStyles.style2darkGreen,
                            decoration: const InputDecoration(
                              helperText: "press enter to save",
                            ),
                            controller: userNameController,
                            onSubmitted: (value) async {
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser?.uid)
                                  .set({"userName": value});
                              setState(() {
                                userName = value;
                                userNameController.text = userName;
                                editName = false;
                              });
                            }),
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    Text(
                      "Welcome $userName",
                      style: AppStyles.style2darkGreen,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: IconButton(
                        onPressed: () => setState(() {
                          editName = true;
                        }),
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.darkGreen,
                          size: 32,
                        ),
                      ),
                    )
                  ],
                ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: taskTextController,
                      decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          label: Text(
                            "What are you working on?",
                          )),
                      maxLines: 5,
                      style: AppStyles.style4darkGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              TaskSizeSelectionPill(
                color: AppColors.smallPill,
                text: "Small task",
                selected: (taskSize == "small"),
                function: () => selectTaskSize(size: "small"),
              ),
              const SizedBox(width: 16),
              TaskSizeSelectionPill(
                color: AppColors.largePill,
                text: "Large task",
                selected: (taskSize == "large"),
                function: () => selectTaskSize(size: "large"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              if (taskTextController.text.trim().isEmpty) {
                showSnackBarMessage(
                    context: context,
                    message: "Sorry, can't post an empty task!");
              } else {
                Task newTask = Task(
                    userName: userName,
                    taskSize: taskSize,
                    taskText: taskTextController.text);

                ref.watch(tasksProvider.notifier).uploadTask(newTask);

                setState(() {
                  taskTextController.clear();
                  taskSize = "small";
                });

                showSnackBarMessage(
                    context: context, message: "Task uploaded!");
              }
            },
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: 160,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Post it', style: AppStyles.style4darkGreen),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.darkGreen,
                    size: 44,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
