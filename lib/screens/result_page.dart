import 'package:flutter/material.dart';

import 'package:bmi_calculator/components/result_page_import.dart';
import 'package:bmi_calculator/constants.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String bmiResult;
  final String interpretation;

  ResultPage(
      {@required this.bmi,
      @required this.bmiResult,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardContainerWidget(
              color: containerBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    this.bmiResult.toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    this.bmi,
                    style: bmiTextStyle,
                  ),
                  Text(
                    this.interpretation,
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButtonWidget(
            title: 'RE-CALCULATE YOUR BMI',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
