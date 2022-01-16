import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_market_application/models/product.dart';
import 'package:super_market_application/providers/product_provider.dart';
import 'package:super_market_application/shared/constants.dart';

// ignore: must_be_immutable
class CardList extends StatelessWidget {
  Product data;
  int index;
  CardList(this.data, this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListTile(
          trailing: IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: green,
              ),
              onPressed: () {
                Provider.of<ProductProviders>(context, listen: false)
                    .removeProducts(index);
              }),
          leading: Icon(
            Icons.note,
            color: green,
          ),
          title: Text("${data.name}"),
          subtitle: Text("${data.price}"),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _category = TextEditingController();

  // Create button
  Widget okButton = TextButton(
    child: Text("ADD"),
    onPressed: () {
      Provider.of<ProductProviders>(context, listen: false)
          .addProducts(_name.text, _price.text, _category.text);
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ADD A Product "),
    content: ListView(
      children: [
        TextField(
          controller: _name,
          decoration: InputDecoration(hintText: "Enter Name"),
        ),
        TextField(
          controller: _price,
          decoration: InputDecoration(hintText: "Enter Price"),
        ),
        TextField(
          controller: _category,
          decoration: InputDecoration(hintText: "Enter category"),
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
