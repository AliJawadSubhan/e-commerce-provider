import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String category, description, image, name, id;
  final bool isInStock;

  ProductModel(
      {required this.category,
      required this.description,
      required this.image,
      required this.name,
      required this.id,
      required this.isInStock});

  factory ProductModel.fromFirestore(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return ProductModel(
      category: snapshot['Category'],
      description: snapshot['Description'],
      image: snapshot['Image'],
      name: snapshot['Name'],
      id: snapshot['id'],
      isInStock: snapshot['isInStock'],
    );
  }
}
