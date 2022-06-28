import 'package:flutter/material.dart';
import 'package:portfolio_website1/constants.dart';

class NavigatorTab extends StatelessWidget {

  String name;
  bool selected;
  void Function()? onTap;

  NavigatorTab({required this.name, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    final S_WIDTH = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: S_WIDTH > kTabletWidth ? S_WIDTH/11: null,
        // color: Colors.red,
        // padding: S_WIDTH > 1200 ? EdgeInsets.symmetric(horizontal: 50.0) : EdgeInsets.symmetric(horizontal: 0.0),
        height: double.infinity,
        child: Center(
          child: Text(this.name),
        ),
        decoration: selected ? BoxDecoration(
            color: Colors.black12
        ) : null,
      ),
    );
  }
}
