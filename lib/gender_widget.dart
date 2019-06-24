import 'package:flutter/material.dart';

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
          size: 72.0,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          this.text,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}