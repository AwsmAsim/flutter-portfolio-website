import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_website1/widgets/neumorphic_container.dart';

import '../widgets/progress_indicator.dart';

class Leetcode extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      height: 300,
      title: 'Leetcode',
        subTitle: 'Total: ${216}',
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyProgressIndicator(
              value: 72,
              total: 216,
              color: Colors.green,
              title: "Easy",
            ),
            MyProgressIndicator(
              value: 129,
              total: 216,
              title: "Medium",
            ),
            MyProgressIndicator(
              value: 15,
              total: 216,
              color: Colors.red,
              title: "Hard",
            ),
          ],
        ),
      ),);
  }
}
