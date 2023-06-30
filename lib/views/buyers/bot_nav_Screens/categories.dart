import 'package:flutter/material.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/catego_controller.dart';
import 'package:provider/provider.dart';

class Caetegories extends StatelessWidget {
  const Caetegories({super.key});

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CategoriesController>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: catProvider.productCategories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 130,
                            width: 130,
                            color: Colors.indigo,
                            child: Text(catProvider.productCategories[index]),
                          ),
                        ),
                        setHorizontalHeight15(),
                        Text(catProvider.productCategories[index]),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
