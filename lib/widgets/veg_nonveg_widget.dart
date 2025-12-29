import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VegNonVegWidget extends StatelessWidget {
  const VegNonVegWidget({super.key, required this.isVeg});

  final bool isVeg;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.lens, color: isVeg ? Colors.green : Colors.red, size: 6),

        const SizedBox(width: 5),
        Text(
          isVeg ? "VEG" : "NON-VEG",
          style: GoogleFonts.montserrat(
            fontSize: 11,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
