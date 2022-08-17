import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  TextOverflow overflow;

  BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF89dad0),
    this.size,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        overflow: overflow,
      ),
    );
  }
}
