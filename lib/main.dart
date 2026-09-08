import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/home_screen.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTextTheme = ThemeData.dark().textTheme;
    final textTheme = GoogleFonts.robotoSlabTextTheme(baseTextTheme).copyWith(
      bodyLarge: baseTextTheme.bodyLarge?.apply(color: Colors.white),
      bodyMedium: baseTextTheme.bodyMedium?.apply(color: Colors.white),
    );

    return MaterialApp(
      title: 'Niemyjski Marcel',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.black87,
        textTheme: textTheme,
      ),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
