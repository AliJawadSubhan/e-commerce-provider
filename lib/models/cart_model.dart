import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String category, name, id, created_at, image;
  final int price, quantity;

  CartModel({
    required this.image,
    required this.created_at,
    required this.quantity,
    required this.category,
    required this.price,
    required this.name,
    required this.id,
  });

  factory CartModel.fromFirestore(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return CartModel(
        created_at: snapshot['created_at'],
        price: snapshot['Price'],
        category: snapshot['Category'],
        name: snapshot['Name'],
        id: snapshot['id'],
        image: snapshot['Image'],
        quantity: snapshot['quantity']);
  }
  Map<String, dynamic> toFirestore() {
    return {
      'quantity': quantity,
      'Image': image,
      'created_at': created_at,
      'Price': price,
      'Category': category,
      'Name': name,
      'id': id,
    };
  }
}
