import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String name;

  const DetailsScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Center(child: Image.asset(name)),
      ),
    );
  }
}
