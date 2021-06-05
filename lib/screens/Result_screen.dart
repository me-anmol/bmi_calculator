import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Custom_widgets/reuable_card.dart';

class ResultScreenState extends StatelessWidget {
  ResultScreenState({this.bmi,this.impressions,this.result});
  final String bmi;
  final String result;
  final String impressions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kInactiveCardColor,
              childCard: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      impressions,
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: kBottomContainerColor,
              height: 70.0,
              child: Center(
                  child: Text(
                    "RE-CALCULATE",
                    style: kLastButtonStyle,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
