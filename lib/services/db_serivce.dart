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
        log('Data : ${data.get('image')}');
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

  Stream<List<ProductModel>> getProductByNameFromFirestore(
      String searchKeyword) {
    final productCollection = fireStoreInstance
        .collection('products')
        .where('Name', isGreaterThanOrEqualTo: searchKeyword)
        .snapshots();

    return productCollection.map((querySnapshots) {
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

  // add to Cart func

  Future<bool> addToCartfunction(
      String userUid, ProductModel productModel) async {
    final cartCollection =
        fireStoreInstance.collection('users').doc(userUid).collection('cart');

    try {
      final cartRefrence = cartCollection.doc(productModel.id);
      final documentRef = cartRefrence.id;
      final cartSnapshot = await cartRefrence.get();

      // Check if the product already exists in the cart
      if (cartSnapshot.exists) {
        // Product already exists in the cart, no need to do anything
        return true;
      } else {
        final userCart = ProductModel(
          created_at: productModel.created_at,
          quantity: productModel.quantity,
          category: productModel.category,
          price: productModel.price,
          description: productModel.description,
          image: productModel.image,
          name: productModel.name,
          id: documentRef,
          isInStock: productModel.isInStock,
        ).toFirestore();
        cartRefrence.set(userCart);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  //get Cart from User
  Stream<List<ProductModel>> getCardOfUserfromFireStore(String userUid) {
    final cartCollection = fireStoreInstance
        .collection('users')
        .doc(userUid)
        .collection('cart')
        .orderBy('created_at')
        .snapshots();
    // .snapshots();

    return cartCollection.map((querySnapshot) {
      final cartList = <ProductModel>[];
      for (QueryDocumentSnapshot data in querySnapshot.docs) {
        ProductModel cartModel = ProductModel.fromFirestore(data);
        cartList.add(cartModel);
      }
      return cartList;
    });
  }

  // delete Product
  Future<bool> removeProductFromCart(
      ProductModel cartModel, String useruid) async {
    return await fireStoreInstance
        .collection('users')
        .doc(useruid)
        .collection('cart')
        .doc(cartModel.id)
        .delete()
        .then((value) {
      return true;
    });
  }

  //Search Product
}
