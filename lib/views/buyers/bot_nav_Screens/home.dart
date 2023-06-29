import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multivendorapp/ui_helper/functions.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'How are you today? ❤️',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                child: const FaIcon(FontAwesomeIcons.shoppingCart),
              )
            ],
          ),
          setVerticalHeight15(),
          SizedBox(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
