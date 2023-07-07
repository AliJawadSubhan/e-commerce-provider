import 'package:flutter/material.dart';
import 'package:multivendorapp/ui_helper/widgets/app_name.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue, // Customize the background color as needed
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppMainText(
                  fontsize:
                      40), // Use the AppMainText widget with a custom font size
              SizedBox(height: 16),
              Text(
                'Welcome to our Amazing E-Commerce App!', // Add a longer description or tagline
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors
                    .white), // Customize the color of the loading indicator
              ), // Add a loading indicator if desired
            ],
          ),
        ),
      ),
    );
  }
}
