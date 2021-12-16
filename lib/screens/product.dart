import 'package:flutter/material.dart';
import 'package:super_market_application/shared/app_bar.dart';
import 'package:super_market_application/shared/product_list.dart';
import 'package:super_market_application/shared/search_bar.dart';
import 'package:super_market_application/shared/side_menu_bar.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);
  dynamic arguments;

  @override
  Widget build(BuildContext context) {
    this.arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('${this.arguments['categoryName']}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SearchBar(),
          const SizedBox(height: 10.0),
          ProductItem('mango.jpeg', 'Mango', 25.0),
          ProductItem('banana.jpeg', 'Banana', 15.0),
          ProductItem('apple.jpeg', 'Apple', 20.0),
        ],
      ),
    );
  }
}
