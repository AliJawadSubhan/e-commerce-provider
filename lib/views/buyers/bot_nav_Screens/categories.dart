import 'package:flutter/material.dart';
import 'package:multivendorapp/ui_helper/widgets/category_screen_Stream.dart';
import 'package:multivendorapp/view_controllers/home_controller.dart';
import 'package:provider/provider.dart';

class Caetegories extends StatelessWidget {
  const Caetegories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<HomeController>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          CategoryStream(),
        ],
      ),
    );
  }
}
