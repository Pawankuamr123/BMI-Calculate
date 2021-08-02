import 'package:flutter/material.dart';
class RoundIcon extends StatelessWidget {
  RoundIcon({@required this.iconData,this.onpress});
  final IconData iconData;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onpress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        height: 35.0,
        width: 35.0,
      ),
      shape:CircleBorder(),
      fillColor:Color(0xff4c4f5e),
    );
  }
}