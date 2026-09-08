import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/screens/projects/project_image_preview.dart';
import 'package:portfolio/screens/projects/project_social_buttons.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/layout/responsive_layout.dart';
import 'package:portfolio/shared/theme/app_theme.dart';
import 'package:portfolio/shared/widgets/tag_chip.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withValues(alpha: 0.95),
        title: Text(project.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: ProjectSocialButtons(project),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (project.images.isNotEmpty)
                  AspectRatio(
                    aspectRatio: isDesktop ? 16 / 9 : 4 / 3,
                    child: ProjectImagePreview(images: project.images),
                  ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  project.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  AppLabels.usedTechnologies,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children:
                      project.libraries.map((tag) => TagChip(tag)).toList(),
                ),
                const SizedBox(height: AppSpacing.lg),
                MarkdownBody(
                  data: project.description,
                  styleSheet: AppTheme.markdownStyle(context),
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
