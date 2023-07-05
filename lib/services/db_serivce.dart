import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multivendorapp/models/banner.dart';
import 'package:multivendorapp/models/cateogories_model.dart';
import 'package:multivendorapp/models/product_model.dart';

class DataBaseService {
  FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;

  sendUserToDataBase(String uid, String email) async {
    var users = fireStoreInstance.collection('users').doc(uid);

    await users.set({
      'email': email,
    });
  }

  Stream<List<CategoryModel>> getCateogoriesFromFirebase() {
    final productCollectoin = fireStoreInstance.collection('cate').snapshots();
    log('Product Collection: $productCollectoin');

    return productCollectoin.map((querySnapshots) {
      final categoryList = <CategoryModel>[];
      log('querysnapshot.length: ${querySnapshots.docs.length}');
      for (var data in querySnapshots.docs) {
        CategoryModel categoryModel = CategoryModel.fromFirebase(data);
        categoryList.add(categoryModel);
        log('Category Model: ${categoryModel.category}');
        log('Data : $data');
      }
      return categoryList;
    });
  }

  // get products
  Stream<List<ProductModel>> getProductFromFirestore() {
    final productCollectoin =
        fireStoreInstance.collection('products').snapshots();
    return productCollectoin.map((querySnapshots) {
      final productList = <ProductModel>[];
      for (var data in querySnapshots.docs) {
        ProductModel products = ProductModel.fromFirestore(data);
        productList.add(products);
      }
      return productList;
    });
  }

  // get banners
  Stream<List<BannerDiscount>> getBannerDiscounts() {
    final bannerCollection =
        fireStoreInstance.collection('banners').snapshots();
    return bannerCollection.map((querySnapshot) {
      final banners = <BannerDiscount>[];
      for (var data in querySnapshot.docs) {
        BannerDiscount banner = BannerDiscount.fromFirebase(data);
        banners.add(banner);
      }
      return banners;
    });
  }
  // getProductsFromCategory

  Stream<List<ProductModel>> getProductsViaCategories(
      {required String category}) {
    final categoryCollection = fireStoreInstance.collection('products');

    if (category != '') {
      final categoriezedProductList = <ProductModel>[];

      return categoryCollection
          .where("Category", isEqualTo: category)
          .snapshots()
          .map((querySnapshot) {
        for (var data in querySnapshot.docs) {
          ProductModel categorizedProduct = ProductModel.fromFirestore(data);
          categoriezedProductList.add(categorizedProduct);
        }
        return categoriezedProductList;
      });
    } else {
      final productList = <ProductModel>[];

      return categoryCollection.snapshots().map((querySnapshots) {
        for (var data in querySnapshots.docs) {
          ProductModel products = ProductModel.fromFirestore(data);
          productList.add(products);
        }
        return productList;
      });
    }
  }
}
