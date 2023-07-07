import 'package:flutter/material.dart';
import 'package:multivendorapp/models/product_model.dart';
import 'package:multivendorapp/services/db_serivce.dart';

class SearchProviderController extends ChangeNotifier {
  String searchQuery = '';

  Stream<List<ProductModel>> getProductByNameFromProvider() {
    return DataBaseService().getProductByNameFromFirestore(searchQuery);
  }

  onChang(val) {
    searchQuery = val;
    notifyListeners();
  }
}
