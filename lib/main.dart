import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_market_application/providers/product_provider.dart';
import 'package:super_market_application/screens/about.dart';
import 'package:super_market_application/screens/admin_add_product.dart';
import 'package:super_market_application/screens/cart.dart';
import 'package:super_market_application/screens/edit_profile.dart';
import 'package:super_market_application/screens/favourite.dart';
import 'package:super_market_application/screens/faq.dart';
import 'package:super_market_application/screens/home.dart';
import 'package:super_market_application/screens/product.dart';
import 'package:super_market_application/screens/signin.dart';
import 'package:super_market_application/screens/signup.dart';
import 'package:super_market_application/shared/constants.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Super Market Application',
        initialRoute: '/signin',
        routes: {
          '/': (context) => Home(),
          '/signin': (context) => SignIn(),
          '/signup': (context) => SignUp(),
          '/editprofile': (context) => EditProfile(),
          '/products': (context) => ProductView(),
          '/cart': (context) => Cart(),
          '/fav': (context) => Favourite(),
          '/add_product': (context) => AddProduct(),
          '/faq': (context) => FAQ(),
          '/about': (context) => About(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: offWhite,
        ),
      ),
    );
  }
}
