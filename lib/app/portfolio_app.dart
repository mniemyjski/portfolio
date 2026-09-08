import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/home_screen.dart';
import 'package:portfolio/shared/theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcel Niemyjski',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: HomeScreen(),
    );
  }
}
