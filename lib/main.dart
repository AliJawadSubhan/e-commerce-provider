import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multivendorapp/base/base_app.dart';
import 'package:multivendorapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MultiVendorApp());
}
