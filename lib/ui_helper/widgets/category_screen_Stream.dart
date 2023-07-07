// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        BoxFit,
        BuildContext,
        Center,
        CircularProgressIndicator,
        Column,
        ConnectionState,
        Divider,
        EdgeInsets,
        Expanded,
        GestureDetector,
        Icon,
        Icons,
        ListView,
        Padding,
        Row,
        SizedBox,
        StatelessWidget,
        StreamBuilder,
        Text,
        Widget;
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/home_controller.dart';
import 'package:provider/provider.dart';

class CategoryStream extends StatelessWidget {
  const CategoryStream({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<HomeController>(context);

    return Expanded(
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
                              child: SizedBox(
                                height: 130,
                                width: 130,
                                // color: Colors.indigo,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: snapshot.data![index].image,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          const SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            setHorizontalHeight15(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(snapshot.data![index].category),
                                GestureDetector(
                                    onTap: () {
                                      categoryProvider.navigateToCategoryScreen(
                                          context,
                                          snapshot.data![index].category);
                                    },
                                    child: const Icon(Icons.arrow_forward_ios)),
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
