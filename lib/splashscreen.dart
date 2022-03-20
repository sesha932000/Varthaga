import 'package:flutter/material.dart';
import 'package:reffralacc/main.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false,home: splash()));
}
class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(

      navigateRoute: const Pub(),
      duration: 3000,
      text: "Varthaga",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,

      ),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.black,
    );

    return MaterialApp(
      home: example1,
    );
  }
}