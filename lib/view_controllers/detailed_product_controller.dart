import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multivendorapp/models/product_model.dart';
import 'package:multivendorapp/services/db_serivce.dart';
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
      productModel?.price = totalAmount;
      final isNotInCar = await _dataBaseService.addToCartfunction(
          authController.currentUserUuid, productModel!);
      log('Added To cart');
      if (isNotInCar) {
        log('Already in cart');
        final snackBar = SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blueGrey,
          elevation: 6,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Row(
            children: [
              const Expanded(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 7),
              Expanded(
                flex: 3,
                child: Text(
                  '${productModel!.name} is already in the Cart',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        buttonText = 'Already exists In cart, Go there';
        notifyListeners();
      }
      buttonText = 'Added this Item to cart';
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      final snackBar = SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blueGrey,
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Row(
          children: [
            const Expanded(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 7),
            Expanded(
              flex: 3,
              child: Text(
                e.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
