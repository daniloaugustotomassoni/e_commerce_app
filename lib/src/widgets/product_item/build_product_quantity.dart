import 'dart:ui';

import 'package:e_commerce_app/src/config/display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../models/sub_total.dart';
import '../../providers/cart.dart';
import '../../providers/products.dart';

class BuildProductQuantity extends StatefulWidget {
  final int index;
  final AnimationController animationController;

  const BuildProductQuantity(
      {super.key, required this.index, required this.animationController});

  @override
  State<BuildProductQuantity> createState() => _BuildProductQuantityState();
}

class _BuildProductQuantityState extends State<BuildProductQuantity> {
  double g = 0;
  double price = 0;

  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();

    return Dialog(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.all(5),
          height: Display.getHeight(context) * .3,
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
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          child: Text(
                            'R\$${price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        child: const Text(
                          '100 Gramas a cada',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        child: Text(
                          'R\$${products.filter[widget.index].price.toStringAsFixed(2)} Kg',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        if (g >= .2) {
                          g -= .1;
                          price = products.filter[widget.index].price * g;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    child: Text(
                      g.toStringAsFixed(3),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        g += .1;
                        price = products.filter[widget.index].price * g;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.green,
                      size: 48,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (g > 0) {
                    products.setIsCart(widget.index);
                    Product product = Product(
                      uuid: products.filter[widget.index].uuid,
                      title: products.filter[widget.index].title,
                      price: price,
                      description: products.filter[widget.index].description,
                      image: products.filter[widget.index].image,
                      category: products.filter[widget.index].category,
                      unit: products.filter[widget.index].unit,
                      subTotal: SubTotal(price,1),
                      others: products.filter[widget.index].others,
                      quantity: g,
                      isCart: products.filter[widget.index].isCart,
                      isPromotion: products.filter[widget.index].isPromotion,
                      promotion: products.filter[widget.index].promotion,
                    );
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
