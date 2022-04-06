import 'package:bezlimit/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

void main() {
  debugRepaintRainbowEnabled=true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home:  HomePage(),
    );
  }
}
