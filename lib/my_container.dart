import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color? color;
  final Widget? child;
  MyContainer({this.color = Colors.white, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
    );
  }
}
