import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/screens/home/home_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

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
      scrollBehavior: const PortfolioScrollBehavior(),
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

class PortfolioScrollBehavior extends MaterialScrollBehavior {
  const PortfolioScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
