import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final MaterialAccentColor c;
  Widget? cardChild;
  final VoidCallback? onPressed;

  ReusableCard({@required this.c = Colors.greenAccent,
    this.cardChild,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: this.c,
        ),
      ),
    );
  }
}
