import 'package:flutter/material.dart';
import 'package:portfolio/shared/theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageGalleryScreen extends StatefulWidget {
  final List<String> images;

  const ImageGalleryScreen(this.images, {super.key});

  @override
  State<ImageGalleryScreen> createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withValues(alpha: 0.9),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: InteractiveViewer(
                    minScale: 0.8,
                    maxScale: 4,
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: widget.images.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 4,
                spacing: 8,
                activeDotColor: AppColors.accent,
                dotColor: AppColors.border,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
