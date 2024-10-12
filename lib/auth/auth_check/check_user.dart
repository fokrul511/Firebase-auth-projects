import 'package:firebase_apps/views/home_screen.dart';
import 'package:firebase_apps/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  ///check user function....
  checkUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return checkUser();
  }
}
