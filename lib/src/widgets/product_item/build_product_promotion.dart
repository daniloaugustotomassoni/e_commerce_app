import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../providers/products.dart';

class BuildProductPromotion extends StatefulWidget {
  final int index;

  const BuildProductPromotion({super.key, required this.index});

  @override
  State<BuildProductPromotion> createState() => _BuildProductPromotionState();
}

class _BuildProductPromotionState extends State<BuildProductPromotion> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Color?> colorTween;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    colorTween = ColorTween(begin: Colors.red, end: Colors.amber)
        .animate(animationController);
    animationController.repeat(reverse: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Expanded(
      flex: 0,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: colorTween.value,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Text(
            '${products.filter[widget.index].promotion}% OFF ',
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
