import 'package:flutter/material.dart';
import 'package:pizza_ui_animation/models/pizza.dart';
import 'package:pizza_ui_animation/pages/home/widgets/pizza_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(left: 25),
        scrollDirection: Axis.horizontal,
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return PizzaCard(
            pizza: pizzas[index],
            scrollController: _scrollController,
          );
        },
      ),
    );
  }
}
