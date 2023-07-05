import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multivendorapp/models/banner.dart';
import 'package:multivendorapp/models/cateogories_model.dart';
import 'package:multivendorapp/models/product_model.dart';
import 'package:multivendorapp/services/db_serivce.dart';
import 'package:multivendorapp/view_controllers/auth_controller.dart';
// import 'package:multivendorapp/ui_helper/widgets/product_stream.dart';
import 'dart:core';
import 'package:multivendorapp/views/product_detail_view.dart';
import 'package:multivendorapp/views/products_from_categories.dart';

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

  navigateToCategoryScreen(context, category) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductsFromCateogry(
        category: category,
      );
    }));
  }

  // goToScreen(category, context) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return ProductsFromCateogry(
  //       products: products,
  //     );
  //   }));
  // }
}
