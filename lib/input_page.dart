import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_container_widget.dart';
import 'gender_widget.dart';

const actionButtonHeight = 80.0;
const containerBackgroundColor = Color(0xFF1D1E33);
const actionButtonColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardContainerWidget(
                    color: containerBackgroundColor,
                    child: GenderWidget(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainerWidget(
                    color: containerBackgroundColor,
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
            color: actionButtonColor,
          )
        ],
      ),
    );
  }
}
