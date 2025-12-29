import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 1;

  void _onCategorySelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 10,
          children: [
            _buildCategoryItem(0, "All"),
            _buildCategoryItem(1, "Premium"),
            _buildCategoryItem(2, "Favorite"),
            _buildCategoryItem(3, "Most Liked"),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(int index, String title) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => _onCategorySelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(30),
              )
            : null,
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
