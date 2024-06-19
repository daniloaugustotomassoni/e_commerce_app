import 'package:e_commerce_app/src/models/enums/categories.dart';
import 'package:e_commerce_app/src/models/enums/units.dart';
import 'package:e_commerce_app/src/models/sub_total.dart';
import 'package:flutter/cupertino.dart';

class Product {
  String uuid;
  String title;
  double price;
  String description;
  String image;
  Categories category;
  Units unit;
  SubTotal subTotal;
  Map<String,dynamic>others;
  double quantity;
  bool isCart;
  bool isPromotion;
  int promotion;

  Product({
    required this.uuid,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.unit,
    required this.others,
    required this.subTotal,
    this.quantity = 0,
    this.isCart = false,
    this.isPromotion = false,
    this.promotion = 0,
  });

  double calculator() {
    double value = price;
    if(isPromotion){
      value = price - (price * (promotion / 100));
    }
    return value;
  }


  @override
  String toString() {
    return 'Product{uuid: $uuid, title: $title, price: $price, description: $description, image: $image, category: $category, unit: $unit, subTotal: $subTotal, others: $others, quantity: $quantity, isCart: $isCart, isPromotion: $isPromotion, promotion: $promotion}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;
}
