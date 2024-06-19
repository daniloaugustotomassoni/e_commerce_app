import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';

class BuildProductPrice extends StatefulWidget {
  final int index;
  const BuildProductPrice({super.key, required this.index});

  @override
  State<BuildProductPrice> createState() => _BuildProductPriceState();
}

class _BuildProductPriceState extends State<BuildProductPrice> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      flex: 0,
      child: Container(
        padding: EdgeInsets.zero,
        child: Text(
          'R\$${products.filter[widget.index].calculator().toStringAsFixed(2)}',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

