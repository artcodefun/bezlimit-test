import 'package:flutter/material.dart';

class ElementView extends StatelessWidget {
  const ElementView({Key? key, this.child}) : super(key: key);
  final Widget? child;
  static const size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: size, width: size,
      child: child,

    );
  }
}
