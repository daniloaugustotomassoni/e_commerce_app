import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';

class BuildProductCartItemSubTotalValue extends StatefulWidget {
  final int index;

  const BuildProductCartItemSubTotalValue({super.key, required this.index});

  @override
  State<BuildProductCartItemSubTotalValue> createState() =>
      _BuildProductCartItemSubTotalValueState();
}

class _BuildProductCartItemSubTotalValueState
    extends State<BuildProductCartItemSubTotalValue> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      child: Container(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'SubTotal: ',
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
              ),
              Expanded(
                child: Text(
                  'R\$${cart.items[widget.index].subTotal.price.toStringAsFixed(2)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
