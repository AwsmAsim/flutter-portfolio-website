import 'dart:html';

import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {

  double value;
  double total; // value of indicator = value / total
  Color color; // Color of the indicator
  String title; // written under the indicator

  MyProgressIndicator({required this.value, this.total = 100, this.color = Colors.orange, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          fit: StackFit.passthrough,
          children: [
            Text(value.toString(),
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              height: 100.0,
              width: 100.0,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: (value/total),
                color: color,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0,),
        Text(title)
      ],
    );
  }
}
