import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:multivendorapp/models/cart_model.dart';
import 'package:multivendorapp/view_controllers/auth_controller.dart';

import '../services/db_serivce.dart';

class CartController extends ChangeNotifier {
  final _dataBaseService = DataBaseService();
  Stream<List<CartModel>> getCartOfUserProvider() {
    return _dataBaseService
        .getCardOfUserfromFireStore(AuthController().currentUserUuid);
  }
}
