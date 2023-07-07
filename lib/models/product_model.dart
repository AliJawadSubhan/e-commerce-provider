import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  // ignore: non_constant_identifier_names
  String? category, description, image, name, id, created_at;
  bool? isInStock;
  int? price, quantity;

  ProductModel(
      {this.category,
      // ignore: non_constant_identifier_names
      this.created_at,
      this.quantity,
      this.price,
      this.description,
      this.image,
      this.name,
      this.id,
      this.isInStock});

  factory ProductModel.fromFirestore(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return ProductModel(
      created_at: snapshot['created_at'],
      price: snapshot['Price'],
      quantity: snapshot['quantity'],
      category: snapshot['Category'],
      description: snapshot['Description'],
      image: snapshot['Image'],
      name: snapshot['Name'],
      id: snapshot['id'],
      isInStock: snapshot['isInStock'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      'Price': price,
      'quantity': quantity,
      'created_at': created_at,
      'Category': category,
      'Description': description,
      'Image': image,
      'Name': name,
      'id': id,
      'isInStock': isInStock,
    };
  }
}
