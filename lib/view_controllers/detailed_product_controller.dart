import 'package:flutter/material.dart';
import 'package:multivendorapp/models/product_model.dart';

class DetailedProductController extends ChangeNotifier {
  ProductModel? productModel;
  String selectedNumber = '1';

  changeProductModel(ProductModel constructerProductModel) {
    productModel = constructerProductModel;
  }

  calculatedPrice() {
    int quantity = 0;
    if (selectedNumber == '1') {
      quantity = 1;
    }

    if (selectedNumber == '2') {
      quantity = 2;
    }

    if (selectedNumber == '3') {
      quantity = 3;
    }

    if (selectedNumber == '4') {
      quantity = 4;
    }

    if (selectedNumber == '5') {
      quantity = 5;
    }
    if (quantity != 0) {
      int finalAmount = productModel!.price * quantity;
      return finalAmount;
    } else {
      return 0;
    }
  }

  initProvider() {
    selectedNumber = '1';
  }

  void onChanged(String value) {
    selectedNumber = value;
    notifyListeners();
    // Handle the selected number change
    // e.g., update state or perform some action
  }
}
