import 'package:flutter/foundation.dart';
import 'package:super_market_application/models/product.dart';

class ProductProviders extends ChangeNotifier {
  List<Product> products = <Product>[];
  List<Product> get getProduct {
    return products;
  }

  void addProducts(String name, String price, String category) {
    Product product = new Product(name, price, category);
    products.add(product);
    notifyListeners();
  }

  void removeProducts(int index) {
    products.removeAt(index);
    notifyListeners();
  }

  int getCatProductCount(String category) {
    int cnt = 0;
    for (int i = 0; i < products.length; i++) {
      if (products[i].category == category) cnt++;
    }
    return cnt;
  }
}
