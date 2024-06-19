import 'package:flutter/material.dart';

import '../models/enums/categories.dart';
import '../models/product.dart';

class Products extends ChangeNotifier {
  List<Product> items;
  List<Product> filter;

  Products({required this.items, required this.filter});

  setIsCart(int index) {
    filter[index].isCart = !filter[index].isCart;
    notifyListeners();
  }

  setProductFilter(Product product) {
    filter.add(product);
    notifyListeners();
  }

  setFilter(int currentSelected) {
    filter.clear();
    if (Categories.values[currentSelected] == Categories.todos) {
      for (var e in items) {
        setProductFilter(e);
      }
    } else {
      for (var e in items) {
        if (e.category == Categories.values[currentSelected]) {
          setProductFilter(e);
        }
      }
    }
  }
}
