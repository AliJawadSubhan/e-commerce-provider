import 'package:flutter/material.dart';
import 'package:multivendorapp/models/product_model.dart';

class DetailedProduct extends ChangeNotifier {
  ProductModel? productModel;

  changeProductModel(ProductModel constructerProductModel) {
    productModel = constructerProductModel;
  }
}
