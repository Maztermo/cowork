import 'package:cowork/constants/app_colors.dart';
import 'package:cowork/constants/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  // Text field state
  var email = '';
  var password = '';
  String tittel = 'Create\na new\nuser';
  String registrerText = 'Register';

  bool registerPage = true;

  @override
  Widget build(BuildContext context) {
    return (registerPage)
        ? Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 300,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        tittel,
                        style: AppStyles.style2,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const SizedBox(height: 5),
                    // Email
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),

                    const SizedBox(height: 5),

                    // Password
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) => value!.length <= 3
                          ? 'Password has to be at least 4 characters'
                          : null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    // Register Button
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.darkGreen),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            UserCredential? result;
                            result = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email.trim(),
                              password: password.trim(),
                            );
                          }
                        },
                        child: Text(
                          registrerText,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      style:
                          TextButton.styleFrom(primary: AppColors.blackGreen),
                      onPressed: () async {
                        setState(() {
                          registerPage = !registerPage;
                        });
                      },
                      child: Text(
                        (registerPage)
                            ? 'Already have a user?'
                            : 'Register new user',
                        style: AppStyles.style5DarkGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 300,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Text(
                      'Welcome\nback!',
                      style: AppStyles.style2,
                    ),
                    const SizedBox(height: 20),
                    // Email
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    // Password
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) => value!.length < 4
                          ? 'Password has to be at least 4 characters'
                          : null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      onFieldSubmitted: (value) async {
                        if (_formKey.currentState!.validate()) {
                          final UserCredential signInResult = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);
                        }
                      },
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.darkGreen),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final UserCredential signInResult =
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email, password: password);
                            print(signInResult);
                          }
                        },
                        child: const Text(
                          'Log inn',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(primary: AppColors.darkGreen),
                      onPressed: () async {
                        setState(() {
                          registerPage = !registerPage;
                        });
                      },
                      child: Text(
                        (registerPage)
                            ? 'Already have a user?'
                            : 'Register new user',
                        style: AppStyles.style5DarkGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
