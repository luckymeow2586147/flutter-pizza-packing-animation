import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:pizza_ui_animation/models/pizza.dart';
import 'package:pizza_ui_animation/pages/details/widgets/description_widget.dart';
import 'package:pizza_ui_animation/pages/details/widgets/image_widget.dart';
import 'package:pizza_ui_animation/pages/details/widgets/ingredients_widget.dart';
import 'package:pizza_ui_animation/pages/details/widgets/price_widget.dart';
import 'package:pizza_ui_animation/pages/details/widgets/rating_widget.dart';
import 'package:pizza_ui_animation/pages/details/widgets/sheets/checkout_sheet.dart';
import 'package:pizza_ui_animation/pages/details/widgets/sheets/discount_sheet.dart';
import 'package:pizza_ui_animation/pages/details/widgets/sheets/order_ready_sheet.dart';
import 'package:pizza_ui_animation/pages/details/widgets/title_widget.dart';
import 'package:pizza_ui_animation/pages/home/home_page.dart';
import 'package:pizza_ui_animation/utils/fade_transition.dart';
import 'package:pizza_ui_animation/widgets/back_button.dart';
import 'package:pizza_ui_animation/widgets/veg_nonveg_widget.dart';

class DetailsPage extends StatefulWidget {
  final Pizza pizza;
  final double? initialRotation;
  const DetailsPage({super.key, required this.pizza, this.initialRotation});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  bool _isDiscountSheetHidden = false;
  bool _isPackingAnimationStarted = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  Future<void> openCheckoutSheet() async {
    await showModalBottomSheet(
      context: context,
      builder: (cont) {
        return CheckoutSheet(
          pizza: widget.pizza,
          onClick: () async {
            Navigator.pop(context);

            if (mounted) {
              setState(() {
                _isPackingAnimationStarted = true;
              });
            }

            // Animate rotation easing into the final state
            _rotationController.animateTo(
              0.8,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.ease,
            );

            // Open OrderReadySheet after a short delay
            await Future.delayed(const Duration(milliseconds: 300));
            if (!mounted) return;
            openOrderReadySheet();

            // Close OrderReadySheet after 4 seconds
            await Future.delayed(const Duration(milliseconds: 4000));
            if (!mounted) return;
            Navigator.pop(context);

            // Navigate back to Home after 100ms
            await Future.delayed(const Duration(milliseconds: 100));
            if (!mounted) return;
            Navigator.pushAndRemoveUntil(
              context,
              createFadeRoute(const HomePage()),
              (route) => false,
            );
          },
        );
      },
    );

    // Reset discount sheet state after a delay
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      setState(() {
        _isDiscountSheetHidden = false;
      });
    }
  }

  void openOrderReadySheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return OrderReadySheet(onClick: () {});
      },
    );
  }

  Future<void> onClickDiscountSheet() async {
    setState(() {
      _isDiscountSheetHidden = true;
    });
    _rotationController.animateTo(
      0.2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    await Future.delayed(const Duration(milliseconds: 400));
    if (mounted) {
      openCheckoutSheet();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child:
                Center(
                      child: Image.asset(
                        "assets/images/open-box.png",
                        width: 350,
                        height: 350,
                        fit: BoxFit.contain,
                      ),
                    )
                    .animate(target: _isPackingAnimationStarted ? 1 : 0)
                    .moveY(begin: -1000, duration: 600.ms, curve: Curves.ease)
                    .fadeOut(delay: 1800.ms, duration: 400.ms),
          ),

          SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 200),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BackArrowButton(),
                          const SizedBox(height: 120),

                          PriceWidget(price: widget.pizza.price)
                              .animate()
                              .fadeIn(
                                delay: 500.ms,
                                duration: 500.ms,
                                curve: Curves.fastEaseInToSlowEaseOut,
                              )
                              .moveX(begin: 100), // FadeInRight

                          Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  VegNonVegWidget(isVeg: widget.pizza.isVeg),
                                  const SizedBox(height: 8),
                                  TitleWidget(title: widget.pizza.title),
                                  const SizedBox(height: 10),
                                  RatingWidget(rating: widget.pizza.rating),
                                  const SizedBox(height: 20),
                                  IngredientsWidget(
                                    ingredients: widget.pizza.ingredients,
                                  ),
                                ],
                              )
                              .animate()
                              .fadeIn(
                                delay: 300.ms,
                                duration: 800.ms,
                                curve: Curves.fastEaseInToSlowEaseOut,
                              )
                              .moveY(begin: 100), // FadeInUp

                          DescriptionWidget(desc: widget.pizza.desc)
                              .animate()
                              .fadeIn(
                                delay: 400.ms,
                                duration: 800.ms,
                                curve: Curves.fastEaseInToSlowEaseOut,
                              )
                              .moveY(begin: 100), // FadeInUp
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .animate(target: _isPackingAnimationStarted ? 1 : 0)
              .fadeOut(duration: 300.ms),

          Positioned(
            right: 0,
            left: 0,
            child: Center(
              child:
                  ImageWidget(
                        image: widget.pizza.image,
                        initialRotation: widget.initialRotation ?? 0,
                      )
                      .animate(controller: _rotationController, autoPlay: false)
                      .rotate(duration: 500.ms) // Spin
                      .animate(target: _isPackingAnimationStarted ? 1 : 0)
                      .move(
                        begin: Offset(
                          MediaQuery.of(context).size.width / 2.5,
                          -80,
                        ),
                        end: Offset(0, 30),
                        duration: 800.ms,
                        curve: Curves.ease,
                      )
                      .scale(
                        begin: Offset(1, 1),
                        end: Offset(0.6, 0.6),
                        duration: 800.ms,
                        curve: Curves.ease,
                      )
                      .fadeOut(delay: 1800.ms, duration: 100.ms),
            ),
          ),

          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child:
                  Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(67, 23, 23, 0.247),
                              blurRadius: 20,
                              spreadRadius: 0,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/top-box.png",
                            width: 250,
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                      .animate(target: _isPackingAnimationStarted ? 1 : 0)
                      .moveY(
                        begin: -1000,
                        delay: 1600.ms,
                        duration: 800.ms,
                        curve: Curves.fastLinearToSlowEaseIn,
                      ) // SlideInDown
                      .shake(delay: 2200.ms, duration: 1000.ms, rotation: 0.05)
                      .fadeOut(
                        delay: 4000.ms,
                        duration: 500.ms,
                        curve: Curves.fastOutSlowIn,
                      )
                      .moveY(
                        end: -100,
                        delay: 4000.ms,
                        duration: 500.ms,
                        curve: Curves.fastOutSlowIn,
                      ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DiscountSheet(onClick: onClickDiscountSheet)
                .animate()
                .fadeIn(
                  delay: 450.ms,
                  duration: 800.ms,
                  curve: Curves.fastEaseInToSlowEaseOut,
                )
                .moveY(begin: 100)
                .animate(target: _isDiscountSheetHidden ? 1 : 0)
                .fadeOut(duration: 300.ms)
                .moveY(end: 100, duration: 300.ms),
          ),
        ],
      ),
    );
  }
}
