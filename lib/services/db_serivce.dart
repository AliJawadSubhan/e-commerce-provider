import 'package:cloud_firestore/cloud_firestore.dart';
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
    return productCollectoin.map((querySnapshots) {
      final productList = <CategoryModel>[];
      for (var data in querySnapshots.docs) {
        CategoryModel products = CategoryModel.fromFirebase(data);
        productList.add(products);
      }
      return productList;
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
}
