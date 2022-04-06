import 'package:flutter/material.dart';

class ContentPartView extends StatelessWidget {
  const ContentPartView({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(height: 30, width:  width, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),);
  }
}
