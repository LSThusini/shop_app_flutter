import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details_page.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final List<String> filters = const ['All', 'Nike', 'Adidas', 'Puma'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(212, 208, 208, 1),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      label: Text(filter),
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    imageUrl: product['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
