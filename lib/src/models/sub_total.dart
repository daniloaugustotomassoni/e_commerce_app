import 'package:e_commerce_app/src/models/product.dart';

class SubTotal{
  double price;
  int total;
  SubTotal(this.price, this.total);

  @override
  String toString() {
    return 'SubTotal{price: $price, total: $total}';
  }

}