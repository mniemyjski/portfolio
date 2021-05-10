import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const CustomTextButton({Key key, this.onPressed, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}
