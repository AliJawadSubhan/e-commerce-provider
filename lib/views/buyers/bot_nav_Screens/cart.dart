import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/cart_controller.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartController>(context);
    return Column(
      children: [
        const Text(
          'Your Cart',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontStyle: FontStyle.italic),
        ),
        setVerticalHeight15(),
        Expanded(
          child: StreamBuilder(
              stream: cartProvider.getCartOfUserProvider(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LinearProgressIndicator());
                }
                if (snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('There is nothing in your cart!'));
                }

                if (snapshot.data == null) {
                  return const Center(
                      child: Text('There is nothing in your cart!'));
                } else {
                  List<int> allPrices = [];
                  for (int index = 0; index < snapshot.data!.length; index++) {
                    int? singlePrice = snapshot.data![index].price;
                    allPrices.add(singlePrice!);
                  }
                  log(allPrices.toString());
                  return Stack(
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 130,
                                              width: 130,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: snapshot
                                                    .data![index].image
                                                    .toString(),
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180, // Adjust the width constraint as needed
                                                child: Text(
                                                    snapshot.data![index].name!,
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  cartProvider
                                                      .calculateProductPrice(
                                                          snapshot.data![index]
                                                              .price!,
                                                          snapshot.data![index]
                                                              .quantity!),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    'Quantity: ${snapshot.data![index].quantity!.toString()}',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  // Spacer(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            22.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        cartProvider
                                                            .deleteProductCart(
                                                                snapshot.data![
                                                                    index],
                                                                context);
                                                      },
                                                      child: const FaIcon(
                                                        FontAwesomeIcons.trash,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'Check out. \$' +
                                      cartProvider
                                          .showTotalPrice(allPrices)
                                          .toString(),
                                  style: const TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }),
        ),
      ],
    );
  }
}
