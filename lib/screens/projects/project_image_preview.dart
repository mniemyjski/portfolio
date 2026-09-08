import 'package:flutter/material.dart';
import 'package:portfolio/screens/projects/image_gallery_screen.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/theme/app_theme.dart';

class ProjectImagePreview extends StatefulWidget {
  final List<String> images;

  const ProjectImagePreview({
    super.key,
    required this.images,
  });

  @override
  State<ProjectImagePreview> createState() => _ProjectImagePreviewState();
}

class _ProjectImagePreviewState extends State<ProjectImagePreview> {
  var _hovered = false;

  void _openGallery() {
    if (widget.images.isEmpty) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageGalleryScreen(widget.images),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return const SizedBox.shrink();
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _openGallery,
        child: AnimatedScale(
          scale: _hovered ? 1.02 : 1,
          duration: const Duration(milliseconds: 200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.image),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  widget.images.first,
                  fit: BoxFit.cover,
                ),
                AnimatedOpacity(
                  opacity: _hovered ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.45),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.photo_library_outlined,
                          color: AppColors.textPrimary,
                          size: 18,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          AppLabels.viewGallery,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
