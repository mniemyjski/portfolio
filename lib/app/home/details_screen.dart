import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailsScreen extends StatelessWidget {
  final String name;

  const DetailsScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: PhotoView(
          imageProvider: AssetImage(name),
        ),
      ),
    );
  }
}
