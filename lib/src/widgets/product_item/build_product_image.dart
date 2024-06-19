import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';

class BuildProductImage extends StatefulWidget {
  final int index;

  const BuildProductImage({super.key, required this.index});

  @override
  State<BuildProductImage> createState() => _BuildProductImageState();
}

class _BuildProductImageState extends State<BuildProductImage> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: .5,
            image: AssetImage(
              products.filter[widget.index].image,
            ),
          ),
        ),
      ),
    );
  }
}
