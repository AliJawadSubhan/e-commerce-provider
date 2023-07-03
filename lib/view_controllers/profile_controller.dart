import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multivendorapp/services/auth_services.dart';
import 'package:multivendorapp/views/auth/login.dart';

class ProfileController extends ChangeNotifier {
  final authService = AuthServices();
  bool isLoading = false;
  get emailAddres => authService.firebaseAuthInstance.currentUser!.email;

  logoutTheUser(context) async {
    try {
      isLoading = true;
      notifyListeners();
      await authService.logoutUser();

      log('Log out successful');
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));
      });
    }
  }
}
