import 'package:flutter/material.dart';
import 'package:portfolio_website1/widgets/neumorphic_container.dart';
import 'package:portfolio_website1/constants.dart';

class About extends StatelessWidget {

  String about = '''
I am a final year Computer Science student pursuing Bachelors of Technology from PSIT, Kanpur. 
    \nI have good problem Solving skills, have completed 200+ questions on Leetcode and have  recently cleared HackWithInfy.
    \nI learnt flutter development from Angela Yu course on Udemy and did some internship experience in Flutter Development.
    \nI have also learnt NodeJS from udemy and have also worked with other backend technologies including Flask, firebase and Back4App.  
  ''';

  @override
  Widget build(BuildContext context) {

    final double S_HEIGHT = MediaQuery.of(context).size.height,
    S_WIDTH = MediaQuery.of(context).size.width;

    double fontSizeReduction = S_WIDTH > kMobileWidth ? 0 : S_WIDTH > kTabletWidth ? kMobileFontSizeReduction - 3 : kMobileFontSizeReduction;

    return NeumorphicContainer(
        title: 'About',
        height: S_WIDTH > kTabletWidth ? S_WIDTH/3  + 150 :
            S_WIDTH > kMobileWidth ? S_HEIGHT + 100 :
                S_HEIGHT + 100.0,
    // MediaQuery.of(context).size.width  > 1000 ? MediaQuery.of(context).size.width/3 + 150 :
    //     MediaQuery.of(context).size.width  > 600 ? MediaQuery.of(context).size.height+100: MediaQuery.of(context).size.height+(600-MediaQuery.of(context).size.height),
        child: MediaQuery.of(context).size.width  > kTabletWidth ?
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.width > 1350 ? MediaQuery.of(context).size.width/3 : MediaQuery.of(context).size.width/3 - 100,
                width: MediaQuery.of(context).size.width > 1350 ? MediaQuery.of(context).size.width/3 : MediaQuery.of(context).size.width/3 - 100,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/dp.png'),
                    fit: BoxFit.fitWidth
                  ),
                )
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red)
                ),
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text('Hi ! I am Muhammad Asim Junaid. A full stack Flutter Developer, technical blogger and avid Problem Solver.',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 1350 ? 25.0 : 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(about,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width > 1350 ? 20.0 : 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ):
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Center(
                child: Container(
                    height: MediaQuery.of(context).size.width/2.5,
                    width: MediaQuery.of(context).size.width/2.5,
                    decoration:const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/dp.png'),
                          fit: BoxFit.fitWidth
                      ),
                    )
                ),
              ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red)
              ),
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text('Hi ! I am Muhammad Asim Junaid. A full stack Flutter Developer, technical blogger and avid Problem Solver.',
                    style: TextStyle(
                      fontSize: 25.0 - fontSizeReduction,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(about,
                    style: TextStyle(
                      fontSize: 20.0 - fontSizeReduction,
                    ),
                  ),
                ],
              ),
            ),

          ],
        )
      ,
    );
  }
}
