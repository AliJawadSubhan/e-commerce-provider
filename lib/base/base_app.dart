import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multivendorapp/view_controllers/cart_controller.dart';
import 'package:multivendorapp/view_controllers/categorized_products_controller.dart';
import 'package:provider/provider.dart';
import 'package:multivendorapp/view_controllers/auth_controller.dart';
import 'package:multivendorapp/view_controllers/detailed_product_controller.dart';
import 'package:multivendorapp/view_controllers/home_controller.dart';
import 'package:multivendorapp/view_controllers/landing_page_controller.dart';
import 'package:multivendorapp/view_controllers/main_screen_Controller.dart';
import 'package:multivendorapp/view_controllers/profile_controller.dart';
import 'package:multivendorapp/views/landing_page.dart';
// import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiVendorApp extends StatelessWidget {
  const MultiVendorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => LandingPageController()),
        ChangeNotifierProvider(create: (_) => MainScreenController()),
        ChangeNotifierProvider(create: (_) => DetailedProductController()),
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => CategorizedProductController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MultiVender Application',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey[50],
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            primary: Colors.indigo,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        home: const LandingPage(),
      ),
    );
  }
}
