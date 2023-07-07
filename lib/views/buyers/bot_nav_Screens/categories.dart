import 'package:flutter/material.dart';
import 'package:multivendorapp/ui_helper/widgets/category_screen_Stream.dart';

class Caetegories extends StatelessWidget {
  const Caetegories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          CategoryStream(),
        ],
      ),
    );
  }
}
