import 'dart:developer';
import 'package:firebase_apps/views/home_screen.dart';
import 'package:firebase_apps/widgets/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void singUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UIHelper.customAlertBox(context, 'Enter Required Field');
    } else {
      //firebase packge give
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
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
        log(e.toString());
        UIHelper.customAlertBox(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SingUp Screen'),
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
            singUp(
              emailController.text.toString(),
              passwordController.text.toString(),
            );
            passwordController.clear();
            emailController.clear();
          }, 'SingUp'),
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
