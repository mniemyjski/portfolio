import 'package:flutter/material.dart';

iconButton({@required Widget icon, @required Color color, @required VoidCallback onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: IconButton(
      color: color,
      icon: icon,
      onPressed: onPressed,
    ),
  );
}
