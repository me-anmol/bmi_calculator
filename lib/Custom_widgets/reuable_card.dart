import 'package:flutter/material.dart';
import '../Constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.childCard,this.onTap});
  final Color color;
  final Widget childCard;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(kMarginField),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kRadiusField),
        ),
        child: childCard,
      ),
    );
  }
}