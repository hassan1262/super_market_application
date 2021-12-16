import 'package:flutter/material.dart';
import 'package:super_market_application/screens/edit_profile.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Market ',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/signin': (context) => SignIn(),
        '/signup': (context) => SignUp(),
        '/editprofile': (context) => EditProfile(),
        '/products': (context) => ProductView(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: offWhite,
      ),
    );
  }
}
