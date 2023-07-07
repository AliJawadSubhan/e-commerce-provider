import 'package:flutter/material.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/auth_controller.dart';
import '../models/product_model.dart';
import '../services/db_serivce.dart';

class CartController extends ChangeNotifier {
  final _dataBaseService = DataBaseService();
  int? price;
  int? quantity;
  Stream<List<ProductModel>> getCartOfUserProvider() {
    return _dataBaseService
        .getCardOfUserfromFireStore(AuthController().currentUserUuid);
  }

  deleteProductCart(ProductModel cartModel, BuildContext context) async {
    await _dataBaseService.removeProductFromCart(
        cartModel, AuthController().currentUserUuid);
    notifyListeners();
    // ignore: use_build_context_synchronously
    showSnackBar('Deleted', context);
  }

  String calculateProductPrice() {
    // final List<String> stringNumbers = ['1', '2', '3', '4', '5'];
    // for (var i = 0; i <= stringNumbers.length; i++) {
    //   if(stringNumbers[i] != '0') {
    //     int integerNumbers = int.parse(stringNumbers[i]);
    //   }
    // }

    int finalAmount = price! * quantity!;

    return finalAmount.toString();
  }

  showTotalPrice(List<int> prices, {required List<int> allQuantityies}) {
    int totalAmount = 0;
    int totalQuantities = 0;

    for (var singleQuantity in allQuantityies) {
      totalQuantities += singleQuantity;
    }
    for (var price in prices) {
      totalAmount += price * totalQuantities;
    }
    return totalAmount.toString();
  }
}
