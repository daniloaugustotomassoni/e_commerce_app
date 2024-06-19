import 'dart:ui';
import 'package:e_commerce_app/src/models/sub_total.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/display.dart';
import '../../models/product.dart';
import '../../providers/cart.dart';
import '../../providers/products.dart';
import 'build_product_various_selected_btn.dart';
import 'build_product_variuos_selected_title.dart';

class BuildProductVariousSelected extends StatefulWidget {
  final int index;
  final AnimationController animationController;

  const BuildProductVariousSelected(
      {super.key, required this.index, required this.animationController});

  @override
  State<BuildProductVariousSelected> createState() =>
      _BuildProductVariousSelectedState();
}

class _BuildProductVariousSelectedState
    extends State<BuildProductVariousSelected> {
  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Dialog(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.all(5),
          height: Display.getHeight(context) * .5,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.zero,
                  child: ListView.builder(
                    itemCount:
                        products.filter[widget.index].others['data'].length,
                    itemBuilder: (_, index) => ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildProductVariousSelectedTitle(
                              title: products.filter[widget.index]
                                  .others['data'][index]['title']),
                          BuildProductVariousSelectedBtn(
                            index: widget.index,
                            subIndex: index,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        products.filter[widget.index].description,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  for (var e in products.filter[widget.index].others['data']) {
                    products.filter[widget.index].others['total'] += e['total'];
                  }
                  if (products.filter[widget.index].others['total'] > 0) {
                    products.setIsCart(widget.index);
                    Product product = Product(
                      uuid: products.filter[widget.index].uuid,
                      title: products.filter[widget.index].title,
                      price: products.filter[widget.index].price *
                          products.filter[widget.index].others['total'],
                      description: products.filter[widget.index].description,
                      image: products.filter[widget.index].image,
                      category: products.filter[widget.index].category,
                      unit: products.filter[widget.index].unit,
                      subTotal: SubTotal(products.filter[widget.index].price *
                          products.filter[widget.index].others['total'], 1),
                      others: products.filter[widget.index].others,
                      isCart: products.filter[widget.index].isCart,
                      isPromotion: products.filter[widget.index].isPromotion,
                      promotion: products.filter[widget.index].promotion,
                    );
                    debugPrint(product.toString());
                    cart.add(product);
                    widget.animationController.forward(from: 0);
                    Navigator.of(context).pop();
                  }
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.amber,
                ),
                label: const Text(
                  'ADICIONAR AO CARRINHO',
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
