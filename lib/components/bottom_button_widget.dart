import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class BottomButtonWidget extends StatelessWidget {

  final Function onTap;
  final String title;

  const BottomButtonWidget({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        margin: EdgeInsets.only(top: 8.0),
        height: actionButtonHeight,
        width: double.infinity,
        color: accentColor,
        padding: EdgeInsets.only(bottom: 8.0),
        child: Container(
          child: Center(
            child: Text(
              this.title,
              style: buttonLargeTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}