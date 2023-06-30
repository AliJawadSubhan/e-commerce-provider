import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multivendorapp/view_controllers/landing_page_controller.dart';

import 'package:multivendorapp/views/auth/login.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: Provider.of<LandingPageController>(context, listen: false)
          .seeIfUserStateChangesOrNot(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          log('Error: ${snapshot.error}');
          return const LoginScreen(); // Display the LoginScreen in case of an error
        } else {
          return const LoginScreen(); // Display the LoginScreen if snapshot.data is null
        }
      },
    );
  }
}
