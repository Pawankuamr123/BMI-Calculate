import 'package:flutter/material.dart';
import '../components/constant.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Result',
          ),),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Expanded(child: Container(
              padding:  EdgeInsets.all(8.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            )

            ),
            Expanded(
              flex: 5,
              child: reusableCard(colour:kactiveCardColor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Text(resultText,style: resultTextStyle,
                    ),),
                    Text(bmiResult,
                      style:kBMITestStyle,),
                    Text(interpretation,style: kbodyTextStyle,
                      textAlign: TextAlign.center,)
                  ],

                ),
              ),
            ),
            BottomButtun(buttonTitle: 'RECALCULATE',
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],

        )
    );
  }
}