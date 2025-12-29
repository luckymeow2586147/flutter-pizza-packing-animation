import 'dart:math';

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    required this.initialRotation,
  });

  final String image;
  final double initialRotation;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image,
      child: Transform.rotate(
        angle: initialRotation - pi,
        child: Image.asset(image, fit: BoxFit.contain, width: 350, height: 350),
      ),
    );
  }
}
