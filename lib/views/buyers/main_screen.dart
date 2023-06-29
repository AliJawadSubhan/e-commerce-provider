import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/cart.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/categories.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/home.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/profile.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/search.dart';
import 'package:multivendorapp/views/buyers/bot_nav_Screens/store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  List _screens = <Widget>[
    Home(),
    Caetegories(),
    Store(),
    Cart(),
    Search(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseChimney), label: 'home'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.box), label: 'cateogiries'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shop), label: 'store'),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shoppingCart),
            label: 'cart',
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass), label: 'search'),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.person),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
