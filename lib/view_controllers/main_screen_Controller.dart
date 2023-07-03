import 'package:flutter/material.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/cart.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/categories.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/home.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/profile.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/search.dart';

class MainScreenController extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);

  int pageIndex = 0;
  final List screens = const <Widget>[
    Home(),
    Caetegories(),
    Cart(),
    Search(),
    Profile(),
  ];

  onpageChange(index) {
    pageIndex = index;
    notifyListeners();
  }

  ontap(value) {
    pageIndex = value;
    pageController.jumpToPage(value);
    notifyListeners();
  }
}
