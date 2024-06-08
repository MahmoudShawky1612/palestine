import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class WallBlock extends StatelessWidget {
  const WallBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: Dimensions.height290,
          color: Color.fromRGBO(0,0,0,1),
          margin:  EdgeInsets.symmetric(vertical: Dimensions.height10, horizontal: Dimensions.height10),
        ),
      ],
    );
  }
}