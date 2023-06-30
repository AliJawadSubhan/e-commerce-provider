import 'package:flutter/material.dart';

class AppMainText extends StatelessWidget {
  const AppMainText({super.key, this.fontsize = 30});
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      'E-Commerce App 🌊',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontsize,
          fontStyle: FontStyle.italic),
    );
  }
}
