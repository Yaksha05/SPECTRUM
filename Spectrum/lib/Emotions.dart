import 'dart:io';
import 'package:my_app/Emotions.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class EmotionsChart extends StatefulWidget {
  const EmotionsChart({Key? key}) : super(key: key);

  @override
  State<EmotionsChart> createState() => _EmotionsChart();
}

class _EmotionsChart extends State<EmotionsChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF78cdff),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/Full_Logo.PNG',
          fit: BoxFit.contain,
          height: 60,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/Happy.png',
              height: 145,
              width: 350,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/Sad.png',
              height: 145,
              width: 350,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/Neutral.png',
              height: 145,
              width: 350,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/Surprise.png',
              height: 145,
              width: 350,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/disgust.png',
              height: 145,
              width: 350,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/Fear.png',
              height: 145,
              width: 350,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/Angry.png',
              height: 145,
              width: 350,
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

// class _EmotionsChart extends State<EmotionsChart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF78cdff),
//       appBar: AppBar(
//           centerTitle: true,
//           title: Image.asset(
//             'assets/Full_Logo.PNG',
//             fit: BoxFit.contain,
//             height: 60,
//           )),
//       body: Container(
//           child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 20,
//           ),
//           Card(
//             elevation: 5,
//             color: const Color.fromARGB(255, 255, 255, 255),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: IntrinsicHeight(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Flexible(
//                       // or exapnded
//                       // fit: FlexFit.tight,
//                       flex: 1,
//                       child: Container(
//                         height: 100,
//                         width: 100,
//                         child: Image.asset(
//                           'assets/AppLogo.JPG',
//                           height: 90,
//                           width: 90,
//                         ),
//                       ),
//                     ),
//                     const Flexible(
//                       flex: 1,
//                       fit: FlexFit.tight,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text("Item 1"),
//                               Text("Item 2"),
//                             ],
//                           ),
//                           Text("Item b x"),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                       flex: 1,
//                       // fit: FlexFit.tight,
//                       child: Container(
//                         color: Colors.cyanAccent,
//                         child: const Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text("lT"),
//                             Text("lBsssssssssssss"),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }
