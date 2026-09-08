import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageGalleryScreen extends StatefulWidget {
  final List<String> images;

  const ImageGalleryScreen(this.images, {super.key});

  @override
  State<ImageGalleryScreen> createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  final _pageController = PageController(viewportFraction: 0.9, keepPage: true);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageWidgets = widget.images
        .map(
          (imagePath) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(imagePath),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imageWidgets.length,
              itemBuilder: (_, index) => imageWidgets[index],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: imageWidgets.length,
            effect: const JumpingDotEffect(
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
