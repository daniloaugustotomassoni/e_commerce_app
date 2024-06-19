import 'package:e_commerce_app/src/widgets/product_cart_item/build_product_cart_item_image.dart';
import 'package:e_commerce_app/src/widgets/product_cart_item/build_product_cart_item_quantity_value.dart';
import 'package:e_commerce_app/src/widgets/product_cart_item/build_product_cart_item_sub_total_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../widgets/product_cart_item/build_product_cart_item_btn.dart';
import '../widgets/product_cart_item/build_product_cart_item_others.dart';
import '../widgets/product_cart_item/build_product_cart_item_title.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: cart.items.length,
            (_, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(5),
                onTap: () {},
                leading: BuildProductCartItemImage(
                  index: index,
                ),
                title: Row(
                  children: [
                    BuildProductCartItemTitle(index: index),
                    BuildProductCartItemBtn(
                      index: index,
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    BuildProductCartItemSubTotalValue(
                      index: index,
                    ),
                    cart.items[index].quantity > 0.0
                        ? BuildProductCartItemQuantityValue(index: index)
                        : BuildProductCartItemOthers(index: index)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
