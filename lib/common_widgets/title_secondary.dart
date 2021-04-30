import 'package:flutter/material.dart';

titleSecondary(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8, top: 8, left: 8),
    child: Container(
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        )),
  );
}
