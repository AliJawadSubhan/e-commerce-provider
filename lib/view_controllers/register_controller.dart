import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multivendorapp/services/auth_services.dart';

class RegisterController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passowrdController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var authService = AuthServices();
  bool isLoading = false;

  signInUser() async {
    if (!emailController.text.contains('@')) {
      log('doesnt contains @');
    }
    if (passowrdController.text == confirmPasswordController.text) {
      if (confirmPasswordController.text.length > 6) {
        try {
          isLoading = true;
          notifyListeners();
          await authService.registerUser(
              emailController.text, confirmPasswordController.text);
        } catch (e) {
          log(e.toString());
        } finally {
          isLoading = false;
          notifyListeners();
        }
      }
    }
  }
}
