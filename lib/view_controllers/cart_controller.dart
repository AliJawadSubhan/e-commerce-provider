import 'package:flutter/material.dart';
import 'package:multivendorapp/models/cart_model.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/auth_controller.dart';

import '../models/product_model.dart';
import '../services/db_serivce.dart';

class CartController extends ChangeNotifier {
  final _dataBaseService = DataBaseService();
  Stream<List<ProductModel>> getCartOfUserProvider() {
    return _dataBaseService
        .getCardOfUserfromFireStore(AuthController().currentUserUuid);
  }

  deleteProductCart(ProductModel cartModel, BuildContext context) async {
    await _dataBaseService.removeProductFromCart(
        cartModel, AuthController().currentUserUuid);
    notifyListeners();
    showSnackBar('Deleted', context);
  }

  Widget calculateProductPrice(int? price, String? quantity) {
    int numberQuantity = 1;

    // final List<String> stringNumbers = ['1', '2', '3', '4', '5'];
    // for (var i = 0; i <= stringNumbers.length; i++) {
    //   if(stringNumbers[i] != '0') {
    //     int integerNumbers = int.parse(stringNumbers[i]);
    //   }
    // }
    switch (quantity) {
      case '1':
        numberQuantity = 1;
        break;
      case '2':
        numberQuantity = 2;
        break;
      case '3':
        numberQuantity = 3;
        break;
      case '4':
        numberQuantity = 4;
        break;
      case '5':
        numberQuantity = 5;
        break;
      default:
        return const Text('No Price');
    }

    int finalAmount = price! * numberQuantity;

    return Text('\$' + finalAmount.toString());
  }

  showTotalPrice(List<int> prices) {
    int totalAmount = 0;
    for (var price in prices) {
      totalAmount = totalAmount + price;
    }
    return totalAmount.toString();
  }
}
