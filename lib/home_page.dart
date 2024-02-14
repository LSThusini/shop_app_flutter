import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_page.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:shop_app_flutter/products_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const [ProductsList(), CartPage()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cart.toString());
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
        ],
      ),
    );
  }
}
