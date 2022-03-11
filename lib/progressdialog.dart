// import 'package:flutter/material.dart';
//
// import 'dart:ui';
//
// class progressdialog extends StatelessWidget {
//   const progressdialog({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.black26.withBlue(200),
//       child: Center(
//         child: Container(
//           padding: const EdgeInsets.all(30.0),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 15.0),
//                   Text(
//                     "Please Wait.......",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.w700),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
