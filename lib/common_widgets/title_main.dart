import 'package:flutter/material.dart';

titleMain(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8, top: 8),
    child: Container(
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black87,
        ),
      ),
    ),
  );
}
