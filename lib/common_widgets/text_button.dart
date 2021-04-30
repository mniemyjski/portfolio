import 'package:flutter/material.dart';

textButton({@required VoidCallback onPressed, @required String name}) {
  return TextButton(onPressed: onPressed, child: Text(name));
}
