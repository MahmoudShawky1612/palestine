import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class WallText extends StatelessWidget {
  final String description;
  const WallText({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return
      Positioned(
        child:  Stack(
          children: [
            Container(
              margin:  EdgeInsets.only(left: Dimensions.height20,
                  right: Dimensions.height20,
                  top: Dimensions.height70),
              width: double.infinity,
              height: Dimensions.height175,
              color: Color.fromRGBO(34, 40, 49,1),
              child: Text("About Me : $description"
                ,textAlign: TextAlign.start,
               // maxLines: 7,
              //  overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color:Color(0xFFA91D3A),
                  fontSize: Dimensions.height16,

                ),
              ),
            ),
          ],
        ),
      );
  }
}
