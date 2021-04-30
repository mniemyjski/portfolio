import 'package:flutter/material.dart';

libCard(String name) {
  return Card(
      child: Padding(
    padding: const EdgeInsets.all(4.0),
    child: Text(name),
  ));
}
