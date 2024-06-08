// import 'package:flutter/material.dart';
// import 'dimensions.dart';
//
// class Buttons extends StatefulWidget {
//
//   @override
//   State<Buttons> createState() => _ButtonsState();
// }
//
// class _ButtonsState extends State<Buttons> {
//   late int counterOne=0;
//   late int counterTwo=0;
//
//
//
//   void counterOnePlus() {
//     setState(() {
//       counterOne++;
//     });
//   }
//
//   void counterTwoPlus() {
//     setState(() {
//       counterTwo++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       bottom:Dimensions.height16,
//       left: Dimensions.height16,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: Dimensions.height38,
//             width: 120,
//             child: ElevatedButton(
//               onPressed: counterOnePlus,
//               child: Text("الله يرحمه $counterOne",
//               style: TextStyle(
//                 color: Colors.black
//               ),
//               ),
//             ),
//           ),
//           // SizedBox(width: Dimensions.height8),
//           // ElevatedButton(
//           //   onPressed: counterTwoPlus,
//           //   child: Text("ربنا يشفيه ويعافيه $counterTwo"),
//           // ),
//         ],
//       ),
//     );
//   }
// }
