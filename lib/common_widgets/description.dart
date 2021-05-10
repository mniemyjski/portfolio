import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String text;
  const Description(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 8, top: 8),
      child: Container(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.justify,
          )),
    );
  }
}
