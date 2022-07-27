import 'package:cowork/community_content.dart';
import 'package:cowork/over_view_content_column.dart';
import 'package:cowork/providers/tabs/tabs_provider.dart';
import 'package:cowork/user_content.dart';
import 'package:cowork/views/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cowork/constants/app_colors.dart';
import 'package:cowork/left_nav_column.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.whiteGreen,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return (FirebaseAuth.instance.currentUser == null)
                ? const SignInPage()
                : Row(
                    children: [
                      const LeftNavColumn(),
                      // Content
                      Expanded(
                        child: PageView(
                          controller: ref.watch(tabsController).pageController,
                          children: const [
                            UserContent(),
                            OverViewContentColumn(),
                            CommunityContent(),
                          ],
                        ),
                      ),
                    ],
                  );
          }),
    );
  }
}
