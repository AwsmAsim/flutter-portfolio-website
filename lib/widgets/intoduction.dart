import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    final double S_HEIGHT = MediaQuery.of(context).size.height,
        S_WIDTH = MediaQuery.of(context).size.width + 50;

    double fontSizeReduction = S_WIDTH > kMobileWidth ? 0 : kMobileFontSizeReduction+10,
    animatedFontSize = 25.0 - fontSizeReduction + 5.0, nameSize = 60.0 - fontSizeReduction*1.2, welcomeTextSize = 35.0 - fontSizeReduction
    ;
    if(S_WIDTH < kMobileWidth) nameSize -= 10;
    if(S_WIDTH < kMobileWidth) animatedFontSize += 2;

    return Column(
      children: [
        Padding(
          padding: MediaQuery.of(context).size.width > 600 ? const EdgeInsets.symmetric(horizontal: 10.0) : const EdgeInsets.only(left: 10.0, right : 0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.passthrough,
              children: [
                IntroductionProfilePic(context),
                IntroductionText(context, welcomeTextSize, nameSize, animatedFontSize),
              ],
            ),
          ),
        ),
      ],
    );
    
  }
  
  Widget IntroductionProfilePic(BuildContext context){
    return Positioned(
      right: MediaQuery.of(context).size.width > 600 ? 10.0: -100.0,
      child: Opacity(
        opacity: 0.8,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('images/dp.png'),
              )),
          width: 600,
          height:
          MediaQuery.of(context).size.height / 2 - 30,
        ),
      ),
    );
  }
  
  Widget IntroductionText(BuildContext context, double welcomeTextSize, double nameSize, double animatedFontSize){

    return Positioned(
        left: 10.0,
        child: Container(
          decoration:
          BoxDecoration(color: Colors.transparent),
          width: 630,
          height:
          MediaQuery.of(context).size.height / 2 - 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Welcome to my Portfolio !',
                      style: GoogleFonts.poppins(
                          fontSize: welcomeTextSize),
                    ),
                    AnimatedTextKit(
                        repeatForever: true,
                        isRepeatingAnimation: true,
                        animatedTexts: [
                          ScaleAnimatedText('👋',
                              textStyle:
                              TextStyle(fontSize: welcomeTextSize))
                        ]),
                  ],
                ),
                AnimatedTextKit(animatedTexts: [
                  ColorizeAnimatedText('Muhammad \nAsim',
                      textStyle: GoogleFonts.poppins(
                          fontSize: nameSize,
                          fontWeight: FontWeight.bold),
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ]),
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My skills include: ',
                      style: GoogleFonts.poppins(
                          fontSize: animatedFontSize),
                    ),
                    AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(
                              'Flutter Development',
                              textStyle:
                              GoogleFonts.poppins(
                                  fontSize: animatedFontSize)),
                          FadeAnimatedText(
                              'NodeJS Backend Devlopment',
                              textStyle:
                              GoogleFonts.poppins(
                                  fontSize: animatedFontSize)),
                          FadeAnimatedText(
                              'Problem Solving',
                              textStyle:
                              GoogleFonts.poppins(
                                  fontSize: animatedFontSize)),
                          FadeAnimatedText(
                              'Content Creation',
                              textStyle:
                              GoogleFonts.poppins(
                                  fontSize: animatedFontSize)),
                          FadeAnimatedText(
                              'Friendly to communicate',
                              textStyle:
                              GoogleFonts.poppins(
                                  fontSize: animatedFontSize)),
                        ]),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
  
}
