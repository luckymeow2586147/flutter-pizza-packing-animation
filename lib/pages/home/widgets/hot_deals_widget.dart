import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_ui_animation/models/pizza.dart';
import 'package:pizza_ui_animation/widgets/veg_nonveg_widget.dart';

class HotDealsWidget extends StatelessWidget {
  const HotDealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Hot Deals Today",
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        SizedBox(
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            itemCount: pizzas.length,
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {
              return Container(
                width: 220,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF3E4D59),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VegNonVegWidget(isVeg: pizzas[index].isVeg),
                      Text(
                        pizzas[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
