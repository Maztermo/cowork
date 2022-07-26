import 'package:cowork/views/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cowork/constants/app_colors.dart';
import 'package:cowork/left_nav_column.dart';
import 'package:cowork/over_view_content_column.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGreen,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return (FirebaseAuth.instance.currentUser == null)
                ? const SignInPage()
                : Row(
                    children: const [
                      LeftNavColumn(),
                      // Content
                      Expanded(child: OverViewContentColumn()),
                    ],
                  );
          }),
    );
  }
}
