import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';

class BuildProductCartItemQuantityValue extends StatefulWidget {
  final int index;

  const BuildProductCartItemQuantityValue({super.key, required this.index});

  @override
  State<BuildProductCartItemQuantityValue> createState() =>
      _BuildProductCartItemQuantityValueState();
}

class _BuildProductCartItemQuantityValueState
    extends State<BuildProductCartItemQuantityValue> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      child: Container(
        child: Row(
          children: [
            const Text('Quantidade: ',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.grey),),
            Expanded(child: Text('${(cart.items[widget.index].quantity * cart.items[widget.index].subTotal.total).toStringAsFixed(3)}g',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
