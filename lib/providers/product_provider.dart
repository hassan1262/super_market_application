import 'package:flutter/foundation.dart';
import 'package:super_market_application/models/product.dart';

class ProductProviders extends ChangeNotifier {
  List<Product> products = <Product>[];
  List<Product> get getProduct {
    return products;
  }

  void addProducts(String name, String price) {
    Product product = new Product(name, price);
    products.add(product);
    notifyListeners();
  }

  void removeProducts(int index) {
    products.removeAt(index);
    notifyListeners();
  }
}
