import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cowork/constants/app_colors.dart';
import 'package:cowork/constants/app_styles.dart';
import 'package:cowork/providers/tasks/user/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftNavColumn extends StatelessWidget {
  const LeftNavColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.darkGreen,
        width: 440,
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text("Kowork", style: AppStyles.style1WhiteBold),
              //const SizedBox(height: 10),
              Text("@tomatoFam", style: AppStyles.style3Orange),
              const SizedBox(height: 40),
              UsernameTextField(),
              const SizedBox(height: 30),
              Text("Overview", style: AppStyles.style3WhiteThin),
              const SizedBox(height: 30),
              Text("Members", style: AppStyles.style3WhiteThin),
              const SizedBox(height: 30),
              Text("Stream mode", style: AppStyles.style3WhiteThin),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Sign out", style: AppStyles.style5WhiteThin),
              )
            ],
          ),
        ));
  }
}

class UsernameTextField extends ConsumerWidget {
  UsernameTextField({
    Key? key,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(ref.watch(userProvider).userName);
    controller.text = ref.watch(userProvider).userName;
    return Focus(
      onFocusChange: (gainFocus) {
        if (!gainFocus) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .set({"userName": controller.text});
        }
      },
      child: TextFormField(
        decoration: InputDecoration(
            label: Text(
          "Username",
        )),
        controller: controller,
        style: AppStyles.style3WhiteThin,
        onFieldSubmitted: (value) => FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .set({"userName": value}),
      ),
    );
  }
}
