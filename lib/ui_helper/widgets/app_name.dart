import 'package:flutter/material.dart';

class AppMainText extends StatelessWidget {
  const AppMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'E-Commerce App 🌊',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontStyle: FontStyle.italic),
    );
  }
}
