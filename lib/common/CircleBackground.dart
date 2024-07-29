import 'package:flutter/material.dart';

class CircleBackground extends StatelessWidget {

  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  const CircleBackground({
    super.key,
    this.color = Colors.red,
    this.padding = const EdgeInsets.all(0),
    required this.child ,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        color:color,
      ),
      padding: padding,
      child:child,
    );
  }
}