import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_container_widget.dart';
import 'gender_widget.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;

  void _genderSelection(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  Color _getBackgroundColor(Gender defineGender) {
    return selectedGender == defineGender
        ? containerBackgroundColor
        : inactiveContainerBackgroundColor;
  }

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
                  ),
                ),
                Expanded(
                  child: CardContainerWidget(
                    color: containerBackgroundColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            height: actionButtonHeight,
            width: double.infinity,
            color: accentColor,
          )
        ],
      ),
    );
  }

  Widget buildHeightLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          height.toString(),
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
        overlayColor: Color(0x29EB1555)
      ),
      child: Slider(
        onChanged: (double value) {
          setState(() {
            height = value.toInt();
          });
        },
        inactiveColor: Color(0xFF8D8E98),
        value: height.toDouble(),
        min: 120.0,
        max: 220.0,
      ),
    );
  }
}
