import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/screens/projects/project_image_preview.dart';
import 'package:portfolio/screens/projects/project_social_buttons.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/layout/responsive_layout.dart';
import 'package:portfolio/shared/theme/app_theme.dart';
import 'package:portfolio/shared/widgets/tag_chip.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.border),
        boxShadow: AppTheme.cardShadow,
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  project.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              ProjectSocialButtons(project),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: ResponsiveLayout(
              mobile: _buildMobileLayout(context),
              desktop: _buildDesktopLayout(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (project.images.isNotEmpty) ...[
            SizedBox(
              height: 220,
              child: ProjectImagePreview(images: project.images),
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          _buildDetails(context, expanded: false),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (project.images.isNotEmpty)
          Expanded(
            flex: 5,
            child: SizedBox(
              height: double.infinity,
              child: ProjectImagePreview(images: project.images),
            ),
          ),
        if (project.images.isNotEmpty) const SizedBox(width: AppSpacing.md),
        Expanded(
          flex: 6,
          child: _buildDetails(context, expanded: true),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context, {required bool expanded}) {
    final libraryChips =
        project.libraries.map((library) => TagChip(library)).toList();

    final markdown = MarkdownBody(
      data: project.description,
      styleSheet: AppTheme.markdownStyle(context),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          children: libraryChips,
        ),
        const SizedBox(height: AppSpacing.md),
        if (expanded)
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(child: markdown),
            ),
          )
        else
          markdown,
      ],
    );
  }
}
