import 'package:e_commerce_app/src/config/display.dart';
import 'package:e_commerce_app/src/config/routes.dart';
import 'package:e_commerce_app/src/providers/cart.dart';
import 'package:e_commerce_app/src/providers/products.dart';
import 'package:e_commerce_app/src/repositories/products_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Display.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Products(
            items: ProductsRepository.items, filter: ProductsRepository.items),
      ),
      ChangeNotifierProvider(
        create: (_) => Cart(items: [],),
      ),
    ],
    child: const ECommerceApp(),
  ));
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      routerConfig: routes,
    ));
  }
}
