import 'package:flutter/material.dart';
import 'package:super_market_application/shared/app_bar.dart';
import 'package:super_market_application/shared/card_list.dart';
import 'package:super_market_application/shared/constants.dart';
import 'package:super_market_application/shared/search_bar.dart';
import 'package:super_market_application/shared/side_menu_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Menu',
                  style: TextStyle(
                    color: green,
                    fontSize: fontSizeHH,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            SearchBar(),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  Cards('fruits.jpeg', 'Fruits'),
                  Cards('bakery.jpeg', 'Bread & Bakery'),
                  Cards('vegtables.jpeg', 'Vegtables'),
                  Cards('personal-care.jpeg', 'Personal Care'),
                  Cards('pasta-rice.jpeg', 'Pasta & Rice'),
                  Cards('meats.jpeg', 'Meats'),
                  Cards('snacks.jpeg', 'Snacks'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
