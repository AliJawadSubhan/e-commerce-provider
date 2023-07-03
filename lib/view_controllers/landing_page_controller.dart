import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:multivendorapp/services/auth_services.dart';
import 'package:multivendorapp/views/auth/login.dart';
import 'package:multivendorapp/views/buyers/main_screen.dart';

class LandingPageController extends ChangeNotifier {
  final authServices = AuthServices();

  seeIfuserEmailNullorNot() {
    return Future.delayed(const Duration(seconds: 2), () {
      log('user email: ${authServices.firebaseAuthInstance.currentUser?.email}');
      if (authServices.firebaseAuthInstance.currentUser?.email == null) {
        return const LoginScreen();
      } else {
        return const MainScreen();
      }
    });
  }
}
