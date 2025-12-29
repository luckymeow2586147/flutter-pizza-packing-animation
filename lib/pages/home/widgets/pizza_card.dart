import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_ui_animation/models/pizza.dart';
import 'package:pizza_ui_animation/pages/details/details_page.dart';
import 'package:pizza_ui_animation/widgets/veg_nonveg_widget.dart';

class PizzaCard extends StatelessWidget {
  final Pizza pizza;
  final ScrollController scrollController;
  static const double _scrollRotationFactor = 0.008;

  const PizzaCard({
    super.key,
    required this.pizza,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              pizza: pizza,
              initialRotation: scrollController.hasClients
                  ? scrollController.offset * _scrollRotationFactor
                  : 0.0,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 240,
        child: Stack(
          children: [
            Positioned(
              top: 40,
              bottom: 15,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(50, 50, 93, 0.25),
                      blurRadius: 27,
                      spreadRadius: -5,
                      offset: Offset(0, 13),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      blurRadius: 16,
                      spreadRadius: -8,
                      offset: Offset(0, 8),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heart Icon
                      SvgPicture.asset(
                        "assets/icons/favourite.svg",
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),

                      Spacer(),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        children: [
                          VegNonVegWidget(isVeg: pizza.isVeg),

                          Text(
                            pizza.title,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 5,
              right: 10,
              child: Center(
                child: Hero(
                  tag: pizza.image,
                  flightShuttleBuilder:
                      (
                        flightContext,
                        animation,
                        flightDirection,
                        fromHeroContext,
                        toHeroContext,
                      ) {
                        final double startAngle = scrollController.hasClients
                            ? scrollController.offset * _scrollRotationFactor
                            : 0.0;

                        return AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            // Rotate from startAngle back to (startAngle - 90 degrees)
                            // This matches the target rotation in DetailsPage (initialRotation - pi)
                            // ensuring a seamless transition.
                            return Transform.rotate(
                              angle: startAngle - (animation.value * (pi)),
                              child: Image.asset(
                                pizza.image,
                                height: 160,
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        );
                      },
                  child: AnimatedBuilder(
                    animation: scrollController,
                    builder: (context, child) {
                      double scrollOffset = scrollController.offset;
                      return Transform.rotate(
                        angle: scrollOffset * _scrollRotationFactor,
                        child: Image.asset(
                          pizza.image,
                          height: 160,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
