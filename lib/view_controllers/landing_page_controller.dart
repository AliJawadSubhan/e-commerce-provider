import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multivendorapp/services/auth_services.dart';
import 'package:multivendorapp/views/auth/login.dart';
import 'package:multivendorapp/views/buyers/main_screen.dart';

class LandingPageController extends ChangeNotifier {
  final authServices = AuthServices();

  Future<Widget> seeIfUserStateChangesOrNot() async {
    Stream<User?> stateChange =
        authServices.firebaseAuthInstance.authStateChanges();
    log('current User: ${authServices.firebaseAuthInstance.currentUser?.email}');
    if (authServices.firebaseAuthInstance.currentUser?.email == null) {
      return const LoginScreen();
    }
    return const MainScreen();
  }
}
