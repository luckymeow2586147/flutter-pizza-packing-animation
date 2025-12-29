import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price});

  final int price;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: GoogleFonts.montserrat(letterSpacing: 2),
      TextSpan(
        children: [
          TextSpan(
            text: "\$$price",
            style: GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const TextSpan(
            text: ".45",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
