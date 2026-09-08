import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/screens/projects/image_gallery_screen.dart';
import 'package:portfolio/screens/projects/project_social_buttons.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/layout/responsive_layout.dart';
import 'package:portfolio/shared/widgets/tag_chip.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard(this.project, {super.key});

  void _openImageGallery(BuildContext context) {
    if (project.images.isEmpty) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageGalleryScreen(project.images),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final libraryChips =
        project.libraries.map((library) => TagChip(library)).toList();

    Widget buildMobileLayout() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: project.images.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: GestureDetector(
                                onTap: () => _openImageGallery(context),
                                child: Image.asset(project.images.first),
                              ),
                            ),
                            ProjectSocialButtons(project),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            SelectableText(
              AppLabels.usedTechnologies,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Wrap(children: libraryChips),
            ),
            MarkdownBody(data: project.description),
            const SizedBox(height: 8),
          ],
        ),
      );
    }

    Widget buildDesktopLayout() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: project.images.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: 415,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => _openImageGallery(context),
                              child: Image.asset(project.images.first),
                            ),
                          ),
                        ),
                        ProjectSocialButtons(project),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    AppLabels.usedTechnologies,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Wrap(children: libraryChips),
                  ),
                  MarkdownBody(data: project.description),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Text(
                project.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ResponsiveLayout(
              mobile: buildMobileLayout(),
              desktop: buildDesktopLayout(),
            ),
          ],
        ),
      ),
    );
  }
}
