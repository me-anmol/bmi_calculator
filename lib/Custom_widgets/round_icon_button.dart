import 'package:flutter/material.dart';
class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon, this.onTap});
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onTap,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
