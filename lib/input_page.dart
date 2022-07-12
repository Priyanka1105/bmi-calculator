import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'bmi_calculator.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected = Gender.Female;
  int height = 180;
  int weight = 60;
  int age = 30;

  // MaterialAccentColor maleColorCard = inActiveCardColor;
  // MaterialAccentColor femaleColorCard = inActiveCardColor;
  //
  // //1 = male, 2 = female
  // void updateColor(Gender gender){
  //   if(gender==Gender.Male){
  //     if(maleColorCard == inActiveCardColor){
  //       maleColorCard = activeCardColor;
  //       femaleColorCard = inActiveCardColor;
  //       print('maleColorCard ==  inActiveCardColor');
  //     }else{
  //       maleColorCard = inActiveCardColor;
  //       print('maleColorCard ==  ActiveCardColor');
  //     }
  //   }else if(gender==Gender.Female){
  //     if(femaleColorCard == inActiveCardColor){
  //       femaleColorCard = activeCardColor;
  //       maleColorCard = inActiveCardColor;
  //     }else{
  //       femaleColorCard = inActiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        genderSelected = Gender.Male;
                      });
                      print('Male card pressed');
                    },
                    c: genderSelected == Gender.Male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: IconContent(
                      myicon: FontAwesomeIcons.mars,
                      mytext: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          genderSelected = Gender.Female;
                        });
                        print('Female card pressed');
                      },
                      c: genderSelected == Gender.Female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        myicon: FontAwesomeIcons.venus,
                        mytext: 'FEMALE',
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    c: kInActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height', style: kTextLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kTextLabelStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            thumbColor: Colors.pink,
                            activeTrackColor: Colors.white,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            // activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                            min: 120,
                            max: 220,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                              // print(newValue);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    c: kInActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kTextLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState((){
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState((){
                                weight--;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    c: kInActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kTextLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState((){
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState((){
                                  age--;
                                });
                              },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottmButton(onTap: (){
            BMICalculator bmc = BMICalculator(height:height,weight:weight);

            Navigator.pushNamed(context, '/result');
          },buttonText: 'Calculate BMI'),
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;

  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Colors.purpleAccent,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      child: Icon(icon, color: Colors.white),
    );
  }
}
