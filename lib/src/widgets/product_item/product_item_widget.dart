import 'package:e_commerce_app/src/providers/cart.dart';
import 'package:e_commerce_app/src/providers/products.dart';
import 'package:e_commerce_app/src/widgets/product_item/build_product_cart_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'build_product_image.dart';
import 'build_product_price.dart';
import 'build_product_price_promotion.dart';
import 'build_product_promotion.dart';
import 'build_product_title.dart';
import 'build_product_description.dart';

class ProductItemWidget extends StatefulWidget {
  final int index;

  const ProductItemWidget({super.key, required this.index});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildProductImage(index: widget.index),
                BuildProductCartBtn(index: widget.index),
                BuildProductTitle(index: widget.index),
                BuildProductDescription(index: widget.index),
                products.filter[widget.index].isPromotion
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildProductPricePromotion(index: widget.index),
                          const Icon(
                            Icons.local_offer_outlined,
                            color: Colors.amberAccent,
                          ),
                          BuildProductPromotion(index: widget.index),
                        ],
                      )
                    : Container(),
                BuildProductPrice(index: widget.index),
              ],
            ),
          ],
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
