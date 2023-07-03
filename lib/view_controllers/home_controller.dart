import 'package:flutter/material.dart';
import 'package:multivendorapp/models/cateogories_model.dart';
import 'package:multivendorapp/models/product_model.dart';
import 'package:multivendorapp/services/db_serivce.dart';
import 'dart:core';

class HomeController extends ChangeNotifier {
  final DataBaseService _dataBaseService = DataBaseService();

  /// get categories via Firestore
  Stream<List<CategoryModel>> getCategoriesFiresotre() {
    return _dataBaseService.getCateogoriesFromFirebase();
  }

  Stream<List<ProductModel>> getProducsts() {
    return _dataBaseService.getProductFromFirestore();
  }
}
