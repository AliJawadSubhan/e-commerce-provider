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
    // TODO: implement initState
    super.initState();
    Provider.of<DetailedProduct>(context, listen: false)
        .changeProductModel(widget.productModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DetailedProduct>(
        builder: (context, detailedProduct, child) {
          if (detailedProduct.productModel == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
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
                    imageUrl: detailedProduct.productModel!.image,
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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            detailedProduct.productModel!.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const Spacer(),
                          detailedProduct.productModel!.isInStock == false
                              ? const Text(
                                  'Out of Stock',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                )
                              : const Text(''),
                          // Text(detailedProduct.productModel),
                        ],
                      ),
                      setVerticalHeight15(),
                      Text(
                        detailedProduct.productModel!.description,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                setVerticalHeight15(),
                detailedProduct.productModel!.isInStock == false
                    ? const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Apologies, Out of Stock.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              '\$${detailedProduct.productModel!.price}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 34),
                            ),
                            setHorizontalHeight15(),
                            const Text(
                              'Only (:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w100, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              detailedProduct.productModel!.isInStock != false
                                  ? Colors.indigo
                                  : Colors.indigo[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Add this item to cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
