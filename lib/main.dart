import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niemyjski Marcel',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.black87,
        // textTheme: GoogleFonts.robotoSlabTextTheme(Theme.of(context).textTheme.copyWith(
        //       bodyText1: Theme.of(context).textTheme.bodyText1.apply(color: Colors.white),
        //       bodyText2: Theme.of(context).textTheme.bodyText1.apply(color: Colors.white),
        //     )),
      ),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
