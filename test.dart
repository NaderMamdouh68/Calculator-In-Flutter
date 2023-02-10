import 'package:flutter/material.dart';
import 'package:flutter_application_2/stateFulWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calc(),
    );
  }
}


class MainColor {
  static const mainColor3 = Color(0xff272727);
  static const mainColor2 = Color(0xff191919);
  static const mainColor1 = Color(0xffD9802E);
  static const blackColor = Colors.black;
  static const whiteColor = Colors.white;
}