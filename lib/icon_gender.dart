import 'package:flutter/material.dart';

class IconGender extends StatelessWidget {
  final String? gender;
  final IconData? icon;

  IconGender({this.gender, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.black54,
          size: 50,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender ?? 'Unknown',
          style: TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
