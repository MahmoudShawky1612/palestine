import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class Circle_Avatar extends StatelessWidget {
  final ImageProvider backgroundImage;
  final double radius;

  const Circle_Avatar({
    super.key,
    required this.backgroundImage,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height40),
      child: CircleAvatar(
        backgroundImage: backgroundImage,
        radius: radius,
      ),
    );
  }
}