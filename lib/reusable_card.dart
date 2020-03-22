import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.color, this.cardChild, this.handler});

  final Color color;
  final Function handler;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.handler,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color != null ? color : kInactiveCardColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
