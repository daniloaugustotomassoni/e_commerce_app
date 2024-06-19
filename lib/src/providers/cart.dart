import 'package:e_commerce_app/src/models/sub_total.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class Cart extends ChangeNotifier {
  List<Product> items;
  int total;
  double price;
  Cart({required this.items, this.total = 0, this.price=0.0});

  add(Product product){
    product.calculator();
    items.insert(0,product);
    total += 1;
    totalPrice();
    notifyListeners();
  }
  remove(Product product){
    product.calculator();
    items.remove(product);
    total -= 1;
    totalPrice();
    notifyListeners();
  }
  addSubTotal(int index){
    items[index].subTotal.total += 1;
    items[index].subTotal.price = items[index].price * items[index].subTotal.total;
    total = items[index].subTotal.total;
    totalPrice();
    notifyListeners();
  }
  removeSubTotal(int index){
    if(items[index].subTotal.total > 1){
      items[index].subTotal.total -= 1;
      items[index].subTotal.price = items[index].price * items[index].subTotal.total;
      total = items[index].subTotal.total;
      totalPrice();
      notifyListeners();
    }
  }
  totalPrice(){
    double data = 0.0;
    price = 0;
    for(var e in items){
      price += e.subTotal.price;
    }
  }
}
