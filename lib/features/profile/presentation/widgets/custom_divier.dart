import 'package:flutter/material.dart';

class CustomDivier extends StatelessWidget {
  const CustomDivier(
      {super.key,
      this.height = 2.0,
      this.indent = 20.0,
      this.color = Colors.grey});

  final double height;
  final double indent;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      indent: indent,
      endIndent: indent,
      color: color,
    );
  }
}
