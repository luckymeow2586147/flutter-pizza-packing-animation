import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.desc});

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      style: GoogleFonts.montserrat(
        fontSize: 14,
        color: Colors.grey[500],
        height: 1.5,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
