import "package:flutter/material.dart";
import 'package:portfolio_website1/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.black
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme
        )
      ),
    );
  }
}
