import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multivendorapp/view_controllers/main_screen_Controller.dart';

import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final mainScreenController = Provider.of<MainScreenController>(context);

    return Scaffold(
      body: SafeArea(
          child: PageView(
        controller: mainScreenController.pageController,
        onPageChanged: (index) {
          mainScreenController.onpageChange(index);
        },
        children: [
          // Add your tab views here
          mainScreenController.screens[mainScreenController.pageIndex],
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainScreenController.pageIndex,
        onTap: (value) {
          mainScreenController.ontap(value);
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
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.box),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartShopping),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
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
