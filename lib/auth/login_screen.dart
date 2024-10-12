import 'dart:developer';

import 'package:firebase_apps/auth/forgot_password.dart';
import 'package:firebase_apps/auth/singUp_screen.dart';
import 'package:firebase_apps/views/home_screen.dart';
import 'package:firebase_apps/widgets/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void logIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UIHelper.customAlertBox(context, "Enter Required Filed");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then(
          (value) {
            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          },
        );
      } on FirebaseAuthException catch (e) {
        log(e.message.toString());
        if (mounted) {
          UIHelper.customAlertBox(context, e.message.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('LogIn Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIHelper.customTextFild(
            emailController,
            'Enter Email',
            Icons.email,
            false,
          ),
          UIHelper.customTextFild(
            passwordController,
            'Enter password',
            Icons.password,
            true,
          ),
          const SizedBox(height: 20),
          UIHelper.customeButton(() {
            logIn(
              emailController.text.toString(),
              passwordController.text.toString(),
            );
            passwordController.clear();
            emailController.clear();
          }, 'LogIn'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already Have an Account??",
                style: TextStyle(fontSize: 16),
              ),
              UIHelper.customTextButton(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SingUpScreen(),
                  ),
                );
              }, "SingUp")
            ],
          ),
          UIHelper.customTextButton(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgotPassword(),
              ),
            );
          }, "Forgate Password")
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
