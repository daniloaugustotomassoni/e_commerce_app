import 'package:e_commerce_app/src/models/enums/categories.dart';
import 'package:e_commerce_app/src/widgets/product_item/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSelected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.black54,
          title: Container(
            padding: EdgeInsets.zero,
            height: 48,
            child: ListView.builder(
              itemCount: Categories.values.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: ChoiceChip(
                  label: Text(Categories.values[index].name.toUpperCase()),
                  selected: currentSelected == index ? true : false,
                  onSelected: (selected) {
                    setState(() {
                      currentSelected = index;
                    });
                    products.setFilter(currentSelected);
                  },
                ),
              ),
            ),
          ),
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .5,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemCount: products.filter.length,
          itemBuilder: (_, index) => ProductItemWidget(index: index),
        ),
      ],
    );
  }
}
