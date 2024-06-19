import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';
class BuildProductTitle extends StatefulWidget {
  final int index;
  const BuildProductTitle({super.key, required this.index});

  @override
  State<BuildProductTitle> createState() => _BuildProductTitleState();
}

class _BuildProductTitleState extends State<BuildProductTitle> {
  @override
  Widget build(BuildContext context) {

    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      flex: 0,
      child: Container(
        padding: EdgeInsets.zero,
        child: Text(
          products.filter[widget.index].title,
          maxLines: 3,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
