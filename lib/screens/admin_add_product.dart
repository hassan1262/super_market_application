// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_market_application/providers/product_provider.dart';
import 'package:super_market_application/shared/admin_card_list.dart';
import 'package:super_market_application/shared/app_bar.dart';
import 'package:super_market_application/shared/constants.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductProviders>(
          builder: (context, ProductProviders data, child) {
            return data.getProduct.length != 0
                ? ListView.builder(
                    itemCount: data.getProduct.length,
                    itemBuilder: (context, index) {
                      return CardList(data.getProduct[index], index);
                    },
                  )
                : GestureDetector(
                    child: Center(
                      child: Text('Add Product'),
                    ),
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        backgroundColor: white,
        child: Icon(
          Icons.add,
          color: green,
        ),
      ),
    );
  }
}
