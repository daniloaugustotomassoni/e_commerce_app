import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';
class BuildProductPricePromotion extends StatefulWidget {
  final int index;
  const BuildProductPricePromotion({super.key, required this.index});

  @override
  State<BuildProductPricePromotion> createState() => _BuildProductPricePromotionState();
}

class _BuildProductPricePromotionState extends State<BuildProductPricePromotion> {
  @override
  Widget build(BuildContext context) {

    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      flex: 0,
      child: Container(
        padding: EdgeInsets.zero,
        child: Text(
          'R\$${products.filter[widget.index].price.toStringAsFixed(2)}',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough),
        ),
      ),
    );
  }
}
