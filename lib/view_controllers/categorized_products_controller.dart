import 'package:flutter/material.dart';
import 'package:multivendorapp/models/product_model.dart';
import 'package:multivendorapp/views/product_detail_view.dart';

import '../services/db_serivce.dart';

class CategorizedProductController extends ChangeNotifier {
  List<ProductModel>? productModel;
  final _dataBaseService = DataBaseService();
  String category = '';
  initStProvider(String category) {
    this.category = category;
  }

  Stream<List<ProductModel>> categorizedProducts() {
    final catProducts =
        _dataBaseService.getProductsViaCategories(category: category);
    return catProducts;
  }

  navigateToDetailScreen(ProductModel productModel, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDetail(
        productModel: productModel,
      );
    }));
  }
}
