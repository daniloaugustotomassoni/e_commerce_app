import 'package:e_commerce_app/src/pages/cart_page.dart';
import 'package:e_commerce_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {

    Products products = context.watch<Products>();
    Cart cart = context.watch<Cart>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          CartPage(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        currentIndex: currentPage,
        backgroundColor: Colors.black,
        snakeViewColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: (indexPage) {
          setState(() {
            currentPage = indexPage;
          });
          pageController.jumpToPage(currentPage);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text('Total: R\$${cart.price.toStringAsFixed(2)}')),
    );
  }
}
