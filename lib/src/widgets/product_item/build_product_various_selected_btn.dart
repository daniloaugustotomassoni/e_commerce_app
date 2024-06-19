import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart.dart';
import '../../providers/products.dart';

class BuildProductVariousSelectedBtn extends StatefulWidget {
  final int index;
  final int subIndex;
  const BuildProductVariousSelectedBtn({super.key, required this.index, required this.subIndex});

  @override
  State<BuildProductVariousSelectedBtn> createState() =>
      _BuildProductVariousSelectedBtnState();
}

class _BuildProductVariousSelectedBtnState
    extends State<BuildProductVariousSelectedBtn> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Row(
      children: [
        IconButton(
          color: Colors.red,
          onPressed: () {
            setState(() {
              if (products.filter[widget.index].others['data'][widget.subIndex]['total']> 0) {
                products.filter[widget.index].others['data'][widget.subIndex]['total'] -= 1;
              }
            });
          },
          icon: const Icon(
            Icons.remove,
            color: Colors.red,
          ),
        ),
        Container(
          padding: EdgeInsets.zero,
          child: Text(
            '${products.filter[widget.index].others['data'][widget.subIndex]['total']}',
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        IconButton(
          color: Colors.green,
          onPressed: () {
            setState(() {
              products.filter[widget.index].others['data'][widget.subIndex]['total'] += 1;
            });
          },
          icon: const Icon(
            Icons.add,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
