import 'package:flutter/material.dart';

const textSize = 18.0;
const iconSize = 72.0;
const separator = 16.0;

class GenderWidget extends StatelessWidget {

  final String text;
  final IconData icon;

  const GenderWidget({
    Key key,
    @required this.text,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: iconSize,
        ),
        SizedBox(
          height: separator,
        ),
        Text(
          this.text,
          style: const TextStyle(
            fontSize: textSize,
            color: const Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}