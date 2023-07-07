// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class BannerDiscount {
  final String banner_image;

  factory BannerDiscount.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return BannerDiscount(banner_image: data['banner-image']);
  }

  BannerDiscount({required this.banner_image});
}
