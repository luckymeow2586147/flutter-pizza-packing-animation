import 'package:flutter/material.dart';
import 'package:pizza_ui_animation/pages/home/widgets/category_list.dart';
import 'package:pizza_ui_animation/pages/home/widgets/custom_app_bar.dart';
import 'package:pizza_ui_animation/pages/home/widgets/header_widget.dart';
import 'package:pizza_ui_animation/pages/home/widgets/hot_deals_widget.dart';
import 'package:pizza_ui_animation/pages/home/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            const CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 200),
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 20,
                  children: [
                    const HeaderWidget(),
                    CategoryList(),
                    ProductList(),
                    const HotDealsWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
