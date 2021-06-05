import 'package:flutter/material.dart';
import '../Constants.dart';

class GenderIcon extends StatelessWidget {
  const GenderIcon({@required this.gender, this.icon});
  final String gender;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
          size: kIconSize,
          color: Colors.white,
        ),
        SizedBox(
          height: kMarginField,
        ),
        Text(
          gender,
          style:kLabelTextStyle,
        )
      ],
    );
  }
}
