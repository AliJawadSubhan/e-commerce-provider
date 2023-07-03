import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String category;
  final String image;

  CategoryModel({required this.category, required this.image});

  factory CategoryModel.fromFirebase(DocumentSnapshot data) {
    var snapshot = data.data() as Map<String, dynamic>;

    return CategoryModel(
      category: snapshot['category'],
      image: snapshot['image'],
    );
  }

  Map<String, dynamic> toFirebase() {
    return {
      'category': category,
      'image': image,
    };
  }
}
