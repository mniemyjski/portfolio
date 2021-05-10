import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundColor: Colors.grey[600],
      backgroundColor: Colors.grey[600],
      radius: 200,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black26,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, -2),
              blurRadius: 2,
              spreadRadius: 2,
            )
          ],
        ),
        child: Image.asset(
          'resources/images/profile_1.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
