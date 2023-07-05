import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String? category, name, id, created_at;
  final int? price, quantity;

  CartModel({
    this.created_at,
    this.quantity,
    this.category,
    this.price,
    this.name,
    this.id,
  });

  factory CartModel.fromFirestore(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return CartModel(
      price: snapshot['Price'],
      category: snapshot['Category'],
      name: snapshot['Name'],
      id: snapshot['id'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      'Price': price,
      'Category': category,
      'Name': name,
      'id': id,
    };
  }
}
