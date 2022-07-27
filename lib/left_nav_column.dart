import 'package:cowork/constants/app_colors.dart';
import 'package:cowork/constants/app_styles.dart';
import 'package:cowork/providers/tabs/tabs_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftNavColumn extends ConsumerWidget {
  const LeftNavColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              TextButton(
                  onPressed: () =>
                      ref.read(tabsController.notifier).goToPage(0),
                  child: Text("My Tasks", style: AppStyles.style3WhiteThin)),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () =>
                      ref.read(tabsController.notifier).goToPage(1),
                  child: Text("Everybody's Tasks",
                      style: AppStyles.style3WhiteThin)),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () => ref.read(tabsController.notifier).goToPage(
                      2), // TODO: add a third page and then update index
                  child: Text("Members", style: AppStyles.style3WhiteThin)),
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
