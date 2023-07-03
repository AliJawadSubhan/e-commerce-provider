import 'package:flutter/material.dart';
import 'package:multivendorapp/models/banner.dart';
import 'package:multivendorapp/models/cateogories_model.dart';
import 'package:multivendorapp/models/product_model.dart';
import 'package:multivendorapp/services/db_serivce.dart';
import 'dart:core';

import 'package:multivendorapp/views/product_detail_view.dart';

class HomeController extends ChangeNotifier {
  final DataBaseService _dataBaseService = DataBaseService();

  /// get categories via Firestore
  Stream<List<CategoryModel>> getCategoriesFiresotre() {
    return _dataBaseService.getCateogoriesFromFirebase();
  }

  Stream<List<ProductModel>> getProducsts() {
    return _dataBaseService.getProductFromFirestore();
  }

  navigateToDetailScreen(ProductModel productModel, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDetail(
        productModel: productModel,
      );
    }));
  }

  Stream<List<BannerDiscount>> getBanners() {
    return _dataBaseService.getBannerDiscounts();
  }
}
