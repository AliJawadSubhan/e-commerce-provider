import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
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
          Expanded(
            child: StreamBuilder(
                stream: categoryProvider.getCategoriesFiresotre(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 130,
                                      width: 130,
                                      // color: Colors.indigo,
                                      child: Image.network(
                                          snapshot.data![index].image),
                                    ),
                                  ),
                                  setHorizontalHeight15(),
                                  Text(snapshot.data![index].category),
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
