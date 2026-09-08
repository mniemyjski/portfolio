import 'package:flutter/material.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/screens/projects/project_card.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/layout/page_section.dart';
import 'package:portfolio/shared/layout/responsive_layout.dart';
import 'package:portfolio/shared/theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectsScreen extends StatefulWidget {
  final List<Project> projects;

  const ProjectsScreen(this.projects, {super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.82);
    _pageController.addListener(_handlePageChanged);
  }

  void _handlePageChanged() {
    final page = _pageController.page?.round() ?? 0;
    if (page != _currentPage) {
      setState(() => _currentPage = page);
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final sectionHeight = MediaQuery.of(context).size.height;
    final carouselHeight = sectionHeight * 0.58;

    return PageSection(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        child: SizedBox(
          height: sectionHeight,
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.xl),
              Text(
                AppLabels.projectsSectionTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                AppLabels.projectsSectionSubtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                height: carouselHeight,
                child: Row(
                  children: [
                    if (isDesktop)
                      _CarouselArrow(
                        icon: Icons.chevron_left,
                        onPressed: _currentPage > 0
                            ? () => _goToPage(_currentPage - 1)
                            : null,
                      ),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.projects.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.xs,
                            ),
                            child: ProjectCard(widget.projects[index]),
                          );
                        },
                      ),
                    ),
                    if (isDesktop)
                      _CarouselArrow(
                        icon: Icons.chevron_right,
                        onPressed: _currentPage < widget.projects.length - 1
                            ? () => _goToPage(_currentPage + 1)
                            : null,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              SmoothPageIndicator(
                controller: _pageController,
                count: widget.projects.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 4,
                  spacing: 8,
                  activeDotColor: AppColors.accent,
                  dotColor: AppColors.border,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CarouselArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _CarouselArrow({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: onPressed == null ? AppColors.border : AppColors.textPrimary,
      ),
    );
  }
}
