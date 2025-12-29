import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({super.key, required this.ingredients});

  final List<Map<String, String>> ingredients;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (MediaQuery.of(context).size.width * 0.01) / 0.7,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Text(
          ingredients[index]['name']!,
          style: GoogleFonts.montserrat(
            fontSize: 15,
            color: Colors.grey[500],
            fontWeight: FontWeight.w600,
          ),
        );
      },
    );
  }
}
