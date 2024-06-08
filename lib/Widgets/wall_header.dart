
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class WallHeader extends StatelessWidget {
  final String name;
  final String date;
  const WallHeader({super.key, required this.name, required this.date});


  @override
  Widget build(BuildContext context) {
    return  Positioned(
      left: Dimensions.height20,
      top: Dimensions.height20,

      child:Row(
        children: [
           CircleAvatar(
            backgroundImage: AssetImage('assets/images/OIP (1).jpg'),
            radius: Dimensions.height20,
          ),
           SizedBox(width: Dimensions.height10), // Spacing between avatar and text
          Text(
            name,
            style:  TextStyle(color: Colors.white, fontSize: Dimensions.height12),
          ),
           SizedBox(width: Dimensions.height230,),
          Text(
            date,
            style:  TextStyle(color: Colors.white, fontSize: Dimensions.height10,
          ),
          ),
        ],
      ),
    );
  }
}
