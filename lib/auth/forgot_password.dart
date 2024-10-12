import 'package:firebase_apps/widgets/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

   forgotPassword(String email) async {
    if (email.isEmpty) {
      return UIHelper.customAlertBox(context, "Enter Email to reset Password");
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIHelper.customTextFild(
            emailController,
            "Enter Email",
            Icons.email,
            false,
          ),
          const SizedBox(height: 20),
          UIHelper.customTextButton(() {
            forgotPassword(emailController.text.toString());
          }, 'Forgot Password')
        ],
      ),
    );
  }
}
