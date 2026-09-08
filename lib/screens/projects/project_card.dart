import 'package:flutter/material.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/screens/projects/project_detail_screen.dart';
import 'package:portfolio/screens/projects/project_image_preview.dart';
import 'package:portfolio/screens/projects/project_social_buttons.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/layout/responsive_layout.dart';
import 'package:portfolio/shared/theme/app_theme.dart';
import 'package:portfolio/shared/utils/project_description_preview.dart';
import 'package:portfolio/shared/widgets/tag_chip.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard(this.project, {super.key});

  void _openDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetailScreen(project),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final previewText = projectDescriptionPreview(project.description);
    final descriptionMaxLines = isDesktop ? 6 : 5;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _openDetails(context),
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(color: AppColors.border),
            boxShadow: AppTheme.cardShadow,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ProjectSocialButtons(project),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Expanded(
                  child: isDesktop
                      ? _buildDesktopLayout(context, previewText, descriptionMaxLines)
                      : _buildMobileLayout(context, previewText, descriptionMaxLines),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    String previewText,
    int descriptionMaxLines,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (project.images.isNotEmpty)
          Expanded(
            flex: 5,
            child: ProjectImagePreview(images: project.images),
          ),
        if (project.images.isNotEmpty) const SizedBox(width: AppSpacing.lg),
        Expanded(
          flex: 6,
          child: _buildContent(context, previewText, descriptionMaxLines),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    String previewText,
    int descriptionMaxLines,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (project.images.isNotEmpty) ...[
          SizedBox(
            height: 200,
            child: ProjectImagePreview(images: project.images),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
        Expanded(
          child: _buildContent(context, previewText, descriptionMaxLines),
        ),
      ],
    );
  }

  Widget _buildContent(
    BuildContext context,
    String previewText,
    int descriptionMaxLines,
  ) {
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
          children: project.libraries.map((tag) => TagChip(tag)).toList(),
        ),
        const SizedBox(height: AppSpacing.md),
        Expanded(
          child: Text(
            previewText,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: descriptionMaxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          AppLabels.viewDetails,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.accent,
              ),
        ),
      ],
    );
  }
}
