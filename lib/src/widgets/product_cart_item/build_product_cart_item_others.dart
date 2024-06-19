import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';

class BuildProductCartItemOthers extends StatefulWidget {
  final int index;

  const BuildProductCartItemOthers({super.key, required this.index});

  @override
  State<BuildProductCartItemOthers> createState() =>
      _BuildProductCartItemOthersState();
}

class _BuildProductCartItemOthersState
    extends State<BuildProductCartItemOthers> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      child: Container(
        padding: EdgeInsets.zero,
        height: 36,
        child: ListView.builder(
          itemCount: cart.items[widget.index].others['data'] != null
              ? cart.items[widget.index].others['data'].length
              : 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) {
            return Container(
              margin: const EdgeInsets.only(right: 5),
              child: Chip(
                avatar: Text('${cart.items[widget.index].others['data'][i]['total']}'),
                label: Text(
                  cart.items[widget.index].others['data'][i]['title'],
                  style:
                      const TextStyle(fontSize: 8, fontWeight: FontWeight.w900),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
