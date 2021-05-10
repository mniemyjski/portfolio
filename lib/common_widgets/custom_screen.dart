import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final Widget child;

  const CustomScreen({this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}
