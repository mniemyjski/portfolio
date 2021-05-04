import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

massageFlushBar(BuildContext context, String txt) {
  FocusScope.of(context).requestFocus(FocusNode());
  Flushbar(
    margin: EdgeInsets.only(bottom: 24, left: 8, right: 8),
    animationDuration: Duration(milliseconds: 700),
    message: txt,
    maxWidth: 300,
    duration: Duration(seconds: 2),
  )..show(context);
}
