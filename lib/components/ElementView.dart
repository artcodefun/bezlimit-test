import 'package:flutter/material.dart';

class ElementView extends StatelessWidget {
  const ElementView({Key? key, this.child, this.size=100, this.color}) : super(key: key);
  final Widget? child;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color ?? Colors.white, borderRadius: BorderRadius.circular(20)),
      height: size, width: size,
      child: child,

    );
  }
}
