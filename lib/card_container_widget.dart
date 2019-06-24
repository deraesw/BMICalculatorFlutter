import 'package:flutter/material.dart';


class CardContainerWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  const CardContainerWidget({
    Key key,
    @required this.color,
    this.child,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: this.child,
      ),
    );
  }
}
