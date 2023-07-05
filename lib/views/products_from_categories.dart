import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:multivendorapp/models/product_model.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/categorized_products_controller.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductsFromCateogry extends StatefulWidget {
  ProductsFromCateogry({super.key, required this.category});

  String category;

  @override
  State<ProductsFromCateogry> createState() => _ProductsFromCateogryState();
}

class _ProductsFromCateogryState extends State<ProductsFromCateogry> {
  @override
  void initState() {
    super.initState();
    log(widget.category.toString());
    Provider.of<CategorizedProductController>(context, listen: false)
        .initStProvider(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CategorizedProductController>(context);
    return Scaffold(
        body: Center(
      child: StreamBuilder(
          stream: catProvider.categorizedProducts(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
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
                        setHorizontalHeight15(width: 8.0),
                        // const  ,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].name.toString(),
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                snapshot.data![index].category.toString(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ),
                              ),
                              setVerticalHeight15(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price: \$${snapshot.data![index].price.toString()}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      catProvider.navigateToDetailScreen(
                                          snapshot.data![index], context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                snapshot.data![index].description.toString(),
                                style: const TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }),
    ));
  }
}
