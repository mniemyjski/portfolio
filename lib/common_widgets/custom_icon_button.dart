import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final VoidCallback onPressed;

  const CustomIconButton({@required this.icon, @required this.color, @required this.onPressed, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        color: color,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
