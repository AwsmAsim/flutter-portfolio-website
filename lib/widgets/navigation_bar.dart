import 'package:flutter/material.dart';

import 'navigator_tab.dart';

class MyNavigationBar extends StatelessWidget {
  List<NavigatorTab> navigatorTabs;
  String logoUrl;

  MyNavigationBar({required this.navigatorTabs, required this.logoUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 6.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(logoUrl),
                    fit: BoxFit.fitHeight
                ),
              ),
              width: 100.0,
            ),
          ),
          // Tabs
          Container(
            width: MediaQuery.of(context).size.width/1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: navigatorTabs,
            ),
          )
        ],
      ),
    );
  }
}
