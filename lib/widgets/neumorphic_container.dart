import 'package:flutter/material.dart';
import 'package:portfolio_website1/widgets/progress_indicator.dart';

class NeumorphicContainer extends StatelessWidget {

  List<MyProgressIndicator> indicators;
  List<BoxShadow> boxShadows;
  String title, subTitle;
  double height, width;
  Widget child;

  NeumorphicContainer({
    required this.title,
    required this.child,
    this.subTitle = "",
    this.indicators = const [],
    this.boxShadows = const [
      BoxShadow(
          color: Color(0xffd9d9d9),
          blurRadius: 5.0,
          offset: Offset(10, 10)
        // blurStyle: BlurStyle.solid
      ),
      BoxShadow(
          color: Color(0xffffffff),
          blurRadius: 5.0,
          offset: Offset(-10, -10)
        // blurStyle: BlurStyle.solid
      )
    ],
    this.height = 300,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: const LinearGradient(
                colors: [Color(0xffe6e6e6), Colors.white70, Color(0xffffffff)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: boxShadows
        ),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
                color: Colors.white,
                width: 3.0,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 15.0),
              ),
              const Flexible(
                  child: SizedBox(
                    height: 30.0,
                  )),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
