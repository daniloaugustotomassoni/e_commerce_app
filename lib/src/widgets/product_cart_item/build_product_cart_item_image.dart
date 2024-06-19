import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';
class BuildProductCartItemImage extends StatefulWidget {
  final int index;
  const BuildProductCartItemImage({super.key, required this.index});

  @override
  State<BuildProductCartItemImage> createState() => _BuildProductCartItemImageState();
}

class _BuildProductCartItemImageState extends State<BuildProductCartItemImage> {
  @override
  Widget build(BuildContext context) {

    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return CircleAvatar(
      backgroundImage: AssetImage(cart.items[widget.index].image),
    );
  }
}
