import 'package:flutter/material.dart';
import 'package:pizza_ui_animation/pages/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza UI Animation',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primaryColor: const Color(0xFFFF7A12),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF7A12),
          secondary: const Color(0xFF2D3B45),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          modalBarrierColor: Colors.transparent,
        ),

        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
