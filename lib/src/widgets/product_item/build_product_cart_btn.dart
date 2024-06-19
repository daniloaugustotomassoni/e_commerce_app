import 'package:e_commerce_app/src/providers/cart.dart';
import 'package:e_commerce_app/src/providers/products.dart';
import 'package:e_commerce_app/src/widgets/product_item/build_product_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../models/enums/units.dart';
import '../../models/product.dart';
import '../../models/sub_total.dart';
import 'build_product_various_selected.dart';

class BuildProductCartBtn extends StatefulWidget {
  final int index;

  const BuildProductCartBtn({
    super.key,
    required this.index,
  });

  @override
  State<BuildProductCartBtn> createState() => _BtnCartState();
}

class _BtnCartState extends State<BuildProductCartBtn>
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
    return IconButton.outlined(
      onPressed: () {
        if (cart.items.contains(products.filter[widget.index])) {
          cart.remove(products.filter[widget.index]);
          products.setIsCart(widget.index);
          animationController.forward(from: 0);
        } else {
          if (products.filter[widget.index].unit == Units.kg &&
              !products.filter[widget.index].isCart) {
            showAdaptiveDialog(
              context: context,
              builder: (_) => BuildProductQuantity(
                index: widget.index,
                animationController: animationController,
              ),
            );
          } else {
            if (products.filter[widget.index].unit == Units.un &&
                products.filter[widget.index].others.isNotEmpty) {
              for (var e in products.filter[widget.index].others['data']) {
                e['total'] = 0;
              }
              products.filter[widget.index].others['total'] = 0;
              showAdaptiveDialog(
                context: context,
                builder: (_) => BuildProductVariousSelected(
                  index: widget.index,
                  animationController: animationController,
                ),
              );
            } else {
              Product product = Product(
                uuid: products.filter[widget.index].uuid,
                title: products.filter[widget.index].title,
                price: products.filter[widget.index].calculator(),
                description: products.filter[widget.index].description,
                image: products.filter[widget.index].image,
                category: products.filter[widget.index].category,
                unit: products.filter[widget.index].unit,
                subTotal: SubTotal(products.filter[widget.index].calculator(),1),
                others: products.filter[widget.index].others,
                quantity: 0,
                isCart: products.filter[widget.index].isCart,
                isPromotion: products.filter[widget.index].isPromotion,
                promotion: products.filter[widget.index].promotion,
              );
              cart.add(product);
              products.setIsCart(widget.index);
              animationController.forward(from: 0);
            }
          }
        }
      },
      icon: products.filter[widget.index].isCart
          ? const Icon(
              Icons.shopping_cart_checkout_outlined,
              color: Colors.green,
            ).animate(controller: animationController).flip().fade()
          : const Icon(Icons.add_shopping_cart_outlined)
              .animate(controller: animationController)
              .flip()
              .fade(),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
