import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';

class BuildProductDescription extends StatefulWidget {
  final int index;

  const BuildProductDescription({super.key, required this.index});

  @override
  State<BuildProductDescription> createState() =>
      _BuildProductDescriptionState();
}

class _BuildProductDescriptionState extends State<BuildProductDescription> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      flex: 0,
      child: Container(
        padding: EdgeInsets.zero,
        child: Text(
          products.filter[widget.index].description,
          maxLines: 4,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
