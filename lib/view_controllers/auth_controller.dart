import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multivendorapp/services/auth_services.dart';
import 'package:multivendorapp/views/buyers/main_screen.dart';

class AuthController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passowrdController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var authService = AuthServices();
  bool isLoading = false;

  get currentUserUuid => authService.firebaseAuthInstance.currentUser!.uid;

  signInUser(BuildContext context) async {
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
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const MainScreen();
          }));
        } catch (e) {
          log(e.toString());
        } finally {
          isLoading = false;
          notifyListeners();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const MainScreen();
          }));
        }
      }
    }
  }

  loginTheUser(BuildContext context) async {
    if (emailController.text != '' && passowrdController.text != '') {
      try {
        isLoading = true;
        notifyListeners();
        await authService.loginUser(
            emailController.text, passowrdController.text);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const MainScreen();
        }));
        log('login completed');
      } catch (e) {
        log(e.toString());
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
