import 'package:flutter/material.dart';
import 'package:portfolio/app/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcel Niemyjski',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.black87,
        textTheme: GoogleFonts.robotoSlabTextTheme(Theme.of(context).textTheme.copyWith(
              body1: Theme.of(context).textTheme.bodyText1.apply(color: Colors.white),
            )),
      ),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
