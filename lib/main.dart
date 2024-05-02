import 'package:ecommerceapp/controllers/Products.dart';
import 'package:ecommerceapp/screens/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home/home_screen.dart';
import 'screens/product_details/provider_models/ExpandText.dart';
import 'screens/product_details/provider_models/ProductActions.dart';
import 'screens/product_details/provider_models/ProductImageSwiper.dart';



Widget defaulthome = SignUpScreen();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance().then((prefs) {
    bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    if (isLoggedIn) {
      defaulthome = HomeScreen();
    }
  });

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductDatabaseHelper()),
    ChangeNotifierProvider(create: (context) => ExpandText()),
    ChangeNotifierProvider(create: (context) => ProductActions()),
    ChangeNotifierProvider(create: (context) => ProductImageSwiper() ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eshopee Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: defaulthome,
    );
  }
}

