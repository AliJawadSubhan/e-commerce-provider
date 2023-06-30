import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multivendorapp/firebase_options.dart';
import 'package:multivendorapp/view_controllers/auth_controller.dart';
import 'package:multivendorapp/view_controllers/catego_controller.dart';
import 'package:multivendorapp/view_controllers/home_controller.dart';
import 'package:multivendorapp/view_controllers/landing_page_controller.dart';
import 'package:multivendorapp/view_controllers/profile_controller.dart';
import 'package:multivendorapp/views/buyers/main_screen.dart';
import 'package:multivendorapp/views/landing_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MultiVendorApp());
}

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
        ChangeNotifierProvider(create: (_) => CategoriesController()),
        ChangeNotifierProvider(create: (_) => LandingPageController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey[50],
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            primary: Colors.indigo,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        home: LandingPage(),
      ),
    );
  }
}
