import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';
class BuildProductCartItemTitle extends StatefulWidget {
  final int index;
  const BuildProductCartItemTitle({super.key, required this.index});

  @override
  State<BuildProductCartItemTitle> createState() => _BuildProductCartItemTitleState();
}

class _BuildProductCartItemTitleState extends State<BuildProductCartItemTitle> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          cart.items[widget.index].title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 14),
        ),
      ),
    );
  }
}
