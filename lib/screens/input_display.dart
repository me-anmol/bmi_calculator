import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/screens/Result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Custom_widgets/reuable_card.dart';
import 'package:bmi_calculator/Custom_widgets/gender_icon.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/Custom_widgets/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: selected == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard:
                        GenderIcon(gender: "MALE", icon: FontAwesomeIcons.mars),
                    onTap: () {
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      color: selected == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childCard: GenderIcon(
                        gender: "FEMALE",
                        icon: FontAwesomeIcons.venus,
                      ),
                      onTap: () {
                        setState(() {
                          selected = Gender.female;
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
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
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              print(calc.getResult());
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return ResultScreenState(bmi: calc.getResultantBMI(),impressions: calc.getImpressions(),result: calc.getResult(),);
              }));
              
            },
            child: Container(
              color: kBottomContainerColor,
              height: 70.0,
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: kLastButtonStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
