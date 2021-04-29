import 'package:flutter/material.dart';
import 'package:portfolio/app/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcel Niemyjski',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Georgia',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
