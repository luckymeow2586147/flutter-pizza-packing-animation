import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/icons/menu.svg",
            width: 40,
            height: 40,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),

          Badge(
            smallSize: 8,
            backgroundColor: const Color(0xFFFF7A12),
            child: SvgPicture.asset(
              "assets/icons/bell.svg",
              width: 30,
              height: 30,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
