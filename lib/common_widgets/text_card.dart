import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String name;
  const TextCard(this.name, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(name),
    ));
  }
}
