import 'package:flutter/material.dart';

description(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8, right: 8),
    child: Container(
        width: double.infinity,
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.black87),
        )),
  );
}
