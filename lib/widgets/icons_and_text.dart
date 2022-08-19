import 'package:flutter/material.dart';

class Icon_and_Text_Widget extends StatelessWidget {
  IconData icon;
  Color iconColor;
  String text;
  Color color;

  Icon_and_Text_Widget(
      {Key? key,
      required this.icon,
      required this.color,
      required this.iconColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  }
}
