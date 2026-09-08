import 'package:flutter/material.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/screens/projects/project_card.dart';
import 'package:portfolio/shared/layout/page_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectsScreen extends StatefulWidget {
  final List<Project> projects;

  const ProjectsScreen(this.projects, {super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final _pageController = PageController(viewportFraction: 0.9, keepPage: true);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectCards =
        widget.projects.map((project) => ProjectCard(project)).toList();

    return PageSection(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 585),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: projectCards.length,
                  itemBuilder: (_, index) => projectCards[index],
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: projectCards.length,
              effect: const JumpingDotEffect(
                dotHeight: 16,
                dotWidth: 16,
                jumpScale: .7,
                verticalOffset: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
