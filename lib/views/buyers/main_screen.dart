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
  final List _screens = <Widget>[
    Home(),
    Caetegories(),
    Cart(),
    Search(),
    Profile(),
  ];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: [
          // Add your tab views here
          _screens[_pageIndex],
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
            _pageController.jumpToPage(value);
          });
        },
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 5,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.box),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shoppingCart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
