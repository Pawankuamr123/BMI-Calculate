import 'package:flutter/material.dart';
import 'constant.dart';
class iconContent extends StatelessWidget {
  iconContent({this.icon,this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40.0,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: klabelTextSTyle,
        ),
      ],
    );
  }
}