import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/input_page_import.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/calculator_bussiness.dart';

import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _selectedGender = Gender.male;
  int _height = 180;
  int _weight = 80;
  int _age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardContainerWidget(
                    onTap: () => _genderSelection(Gender.male),
                    color: _getBackgroundColor(Gender.male),
                    child: GenderWidget(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainerWidget(
                    onTap: () => _genderSelection(Gender.female),
                    color: _getBackgroundColor(Gender.female),
                    child: GenderWidget(
                      text: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: CardContainerWidget(
              color: containerBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  buildHeightLabel(),
                  buildSlider()
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardContainerWidget(
                    color: containerBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              _weight.toString(),
                              style: labelBigTextStyle,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "kg",
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        buildButtonRow(_reduceWeight, _increaseWeight),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainerWidget(
                    color: containerBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              _age.toString(),
                              style: labelBigTextStyle,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "year",
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        buildButtonRow(_reduceAge, _increaseAge)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButtonWidget(
            title: 'CALCULATE',
            onTap: () {
              CalculatorBusiness cal = CalculatorBusiness(height: this._height, weight: this._weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmi: cal.calculateBMI(),
                    bmiResult: cal.getResult(),
                    interpretation: cal.getInterpretation(),
                  )));
            },
          )
        ],
      ),
    );
  }

  Widget buildButtonRow(Function minusAction, Function addAction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RoundIconButton(
          onPressed: minusAction,
          child: Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        RoundIconButton(
          onPressed: addAction,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildHeightLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          _height.toString(),
          style: labelBigTextStyle,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          'cm',
          style: labelTextStyle,
        )
      ],
    );
  }

  Widget buildSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          thumbColor: accentColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
          overlayColor: Color(0x29EB1555)),
      child: Slider(
        onChanged: (double value) {
          setState(() {
            _height = value.toInt();
          });
        },
        inactiveColor: Color(0xFF8D8E98),
        value: _height.toDouble(),
        min: 120.0,
        max: 220.0,
      ),
    );
  }

  Color _getBackgroundColor(Gender defineGender) {
    return _selectedGender == defineGender
        ? containerBackgroundColor
        : inactiveContainerBackgroundColor;
  }

  void _genderSelection(Gender gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  void _reduceWeight() {
    setState(() {
      if (_weight > 30) {
        _weight--;
      }
    });
  }

  void _increaseWeight() {
    setState(() {
      if (_weight < 300) {
        _weight++;
      }
    });
  }

  void _reduceAge() {
    setState(() {
      if (_age > 10) {
        _age--;
      }
    });
  }

  void _increaseAge() {
    setState(() {
      if (_age < 110) {
        _age++;
      }
    });
  }
}
