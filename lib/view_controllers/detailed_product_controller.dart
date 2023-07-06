import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multivendorapp/models/product_model.dart';
import 'package:multivendorapp/services/db_serivce.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/auth_controller.dart';

class DetailedProductController extends ChangeNotifier {
  ProductModel? productModel;
  String selectedNumber = '1';
  final AuthController authController = AuthController();
  final DataBaseService _dataBaseService = DataBaseService();
  bool isLoading = false;
  changeProductModel(ProductModel constructerProductModel) {
    productModel = constructerProductModel;
  }

  int? totalAmount;

  String buttonText = 'Add this Item to cart.';

  addToCartProvider(context) async {
    try {
      isLoading = true;
      notifyListeners();

      productModel?.quantity = selectedNumber;
      productModel?.created_at = DateTime.now().toString();

      final isInCart = await _dataBaseService.addToCartfunction(
          authController.currentUserUuid, productModel!);
      log('Added To cart');
      buttonText = 'Added to Cart';
      notifyListeners();
      if (isInCart) {
        log('Already in cart');
        showSnackBar('${productModel!.name} is already in the Cart', context);

        buttonText = 'Already exists In cart, Go there';
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      showSnackBar(e.toString(), context);
    } finally {
      isLoading = false;
      notifyListeners();
    }
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
      int finalAmount = productModel!.price! * quantity;
      totalAmount = finalAmount;
      return finalAmount;
    } else {
      return 0;
    }
  }

  initProvider() {
    selectedNumber = '1';

    buttonText = 'Add this Item to cart';
  }

  void onChanged(String value) {
    selectedNumber = value;
    notifyListeners();
    // Handle the selected number change
    // e.g., update state or perform some action
  }
}
