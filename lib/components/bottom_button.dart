import 'package:flutter/material.dart';
import 'constant.dart';
class BottomButtun extends StatelessWidget {
  BottomButtun({@required this.onTap,this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child:Container(
        child: Center(
          child: Text(
            buttonTitle,style: klargebuttonstye,),
        ),
        color: kbottonContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}