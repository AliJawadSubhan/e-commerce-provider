import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multivendorapp/view_controllers/landing_page_controller.dart';
import 'package:multivendorapp/views/auth/login.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LandingPageController>(context, listen: false)
        .seeIfuserEmailNullorNot();
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<Widget>(
    //   future: Provider.of<LandingPageController>(context, listen: true)
    //       .seeIfUserStateChangesOrNot(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(
    //             color: Colors.indigo,
    //           ),
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       log('Error: ${snapshot.error}');
    //       return const LoginScreen();
    //     } else if (snapshot.data == null) {
    //       return const LoginScreen(); // Display the LoginScreen if snapshot.data is null
    //     } // Display the LoginScreen in case of an error

    //     else {
    //       return const MainScreen(); // Display the LoginScreen if snapshot.data is null
    //     }
    //   },
    // );
    return FutureBuilder<dynamic>(
      future: Provider.of<LandingPageController>(context, listen: false)
          .seeIfuserEmailNullorNot(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while the future is being resolved
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          // Handle any error that occurred while resolving the future
          log('Error: ${snapshot.error}');
          return const LoginScreen();
        } else {
          // Display the appropriate screen based on the resolved future value
          return snapshot.data ?? LoginScreen();
        }
      },
    );
  }
}
