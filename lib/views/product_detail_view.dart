import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multivendorapp/models/product_model.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/detailed_product_controller.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    super.initState();
    Provider.of<DetailedProductController>(context, listen: false)
        .changeProductModel(widget.productModel);

    Provider.of<DetailedProductController>(
      context,
      listen: false,
    ).initProvider();
  }

  @override
  Widget build(BuildContext context) {
    log('build crated');
    return Scaffold(
      body: Consumer<DetailedProductController>(
        builder: (context, detailedProduct, child) {
          if (detailedProduct.productModel == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7), // shadow color
                          spreadRadius: 2, // spread radius
                          blurRadius: 5, // blur radius
                          offset: const Offset(
                              0, 3), // changes the position of the shadow
                        ),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: detailedProduct.productModel!.image!,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => const SizedBox(
                        height: 50,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  setVerticalHeight15(),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              detailedProduct.productModel!.name!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            const Spacer(),

                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.indigo,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                              child: Text(
                                detailedProduct.productModel!.category!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            // Text(detailedProduct.productModel),
                          ],
                        ),
                        setVerticalHeight15(),
                        Text(
                          detailedProduct.productModel!.description!,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  setVerticalHeight15(),
                  detailedProduct.productModel!.isInStock == false
                      ? const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'Apologies, Out of Stock.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            // mainAxisAlignment:,
                            children: [
                              Text(
                                '\$${detailedProduct.calculatedPrice()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 34),
                              ),
                              setHorizontalHeight15(),
                              const Text(
                                'Only (:',
                                style: TextStyle(
                                    fontWeight: FontWeight.w100, fontSize: 14),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 70,
                                width: 80,
                                child: buildNumberDropdown(
                                    detailedProduct.onChanged,
                                    detailedProduct.selectedNumber),
                              )
                            ],
                          ),
                        ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        detailedProduct.productModel!.isInStock != false
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  detailedProduct.addToCartProvider(context);
                                },
                                child: detailedProduct.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        detailedProduct.buttonText,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.indigo[100],
                                  ),
                                  height: 37,
                                  child: Center(
                                    child: Text(
                                      'Add this item to cart',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
