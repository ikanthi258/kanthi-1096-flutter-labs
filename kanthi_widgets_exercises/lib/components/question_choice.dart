import 'package:flutter/material.dart';

class QuestionChoice extends StatelessWidget {
  final String name;
  final Color bgColor;
  final Color? fgColor;
  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor;
    if (fgColor != null) {
      textColor = fgColor!;
    } else {
      textColor =
          (ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
          ? Colors.white
          : Colors.black);
      ;
    }
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
