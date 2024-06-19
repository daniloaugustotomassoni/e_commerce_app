import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';
class BuildProductCartItemBtn extends StatefulWidget {
  final int index;
  const BuildProductCartItemBtn({super.key, required this.index});

  @override
  State<BuildProductCartItemBtn> createState() => _BuildProductItemCartBtnState();
}

class _BuildProductItemCartBtnState extends State<BuildProductCartItemBtn> {
  @override
  Widget build(BuildContext context) {

    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            color: Colors.red,
            onPressed: () {
              cart.removeSubTotal(widget.index);
            },
            icon: const Icon(
              Icons.remove,
              color: Colors.red,
            ),
          ),
          Text(cart.items[widget.index].subTotal.total.toString(),style: const TextStyle(fontWeight: FontWeight.w900),),
          IconButton(
            color: Colors.green,
            onPressed: () {
              cart.addSubTotal(widget.index);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
