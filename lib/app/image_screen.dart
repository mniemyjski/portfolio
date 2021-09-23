import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageScreen extends StatefulWidget {
  final List<String> images;

  const ImageScreen(this.images, {Key? key}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final controller = PageController(viewportFraction: 0.9, keepPage: true);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = widget.images
        .map((e) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(e),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              controller: controller,
              itemBuilder: (_, index) {
                return _items[index % _items.length];
              },
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: _items.length,
            effect: JumpingDotEffect(
              dotHeight: 16,
              dotWidth: 16,
              jumpScale: .7,
              verticalOffset: 15,
            ),
          ),
        ],
      ),
    );
  }
}
