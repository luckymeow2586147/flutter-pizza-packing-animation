import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < rating.floor() ? Icons.star : Icons.star_border,
              color: const Color(0xFFFF7A12),
              size: 20,
            );
          }),
        ),
        const SizedBox(width: 10),
        Text(
          "$rating",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF7A12),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          "(40)",
          style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey[400]),
        ),
      ],
    );
  }
}
