import 'package:flutter/material.dart' ;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import 'results_page.dart';
import '../components/constant.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../components/calculator_brain.dart';
import '../components/reusable_card.dart';
enum Gender{
  male,female,
}
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded
            (child: Row(
            children: [
              Expanded(child:GestureDetector (
                onTap: (){
                  setState(() {
                    selectedGender=Gender.male;
                  });
                },
                child: reusableCard(
                  colour: selectedGender==Gender.male? kactiveCardColor:kinactiveCardColor,
                  cardchild: iconContent(icon:  FontAwesomeIcons.mars,label: 'MALE',),
                ),
              )),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender=Gender.female;
                    });
                  },
                  child: reusableCard(
                    colour: selectedGender==Gender.female?kactiveCardColor:kinactiveCardColor,
                    cardchild: iconContent(icon:  FontAwesomeIcons.venus,label: 'FEMALE',),
                  ),
                ),
              ),
            ],
          ),),

          Expanded(
            child: reusableCard(
              colour: kactiveCardColor,
              cardchild: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Center(
                      child: Text('HEIGHT',style: klabelTextSTyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),style:kmiddleTextStyle),

                        Text('cm',style:klabelTextSTyle,),
                      ],
                    ),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: Color(0xff8d8e98),
                        activeTrackColor: Color(0xffeb1555),
                        overlayColor: Color(0x29eb1555),
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius:10.0),
                        overlayShape:RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                      child: Slider(value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.white,
                        onChanged: (double newValue ) {
                          setState(() {
                            height=newValue.round();
                          });
                        },
                      ),
                    )],
                ),
              ),
            ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: reusableCard(
                colour: kactiveCardColor,
                cardchild: SingleChildScrollView(
                  child: Column(

                    children: [

                      Text(
                        'WEIGHT',
                        style: klabelTextSTyle,
                      ),
                      Text(weight.toString(),
                        style: kmiddleTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            iconData:FontAwesomeIcons.minus,
                            onpress: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIcon(
                            iconData:FontAwesomeIcons.plus,
                            onpress: (){
                              setState(() {
                                weight++;});
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ),
              Expanded(child: reusableCard(
                colour: kactiveCardColor,
                cardchild: SingleChildScrollView(
                  child: Column(

                    children: [
                      Text(
                        'AGE',
                        style: klabelTextSTyle,
                      ),
                      Text(age.toString(),
                        style: kmiddleTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            iconData:FontAwesomeIcons.minus,
                            onpress: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIcon(
                            iconData:FontAwesomeIcons.plus,
                            onpress: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ),
            ],
          ),),
          BottomButtun(
            buttonTitle: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ResultsPage(
                    bmiResult:calc.calculateBMI(),
                    resultText:calc.getResults(),
                    interpretation:calc.getInterpretation(),
                  )));
            },
          ),
        ],
      ),
    );
  }
}


