import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  double? height;
  TextOverflow textOverflow;
  int? maxlines;

  SmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF89dad0),
    this.size,
    this.height,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
