import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;

  const DefaultText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
