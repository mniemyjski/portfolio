import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/theme/app_theme.dart';
import 'package:portfolio/shared/utils/open_url.dart';

class ProjectSocialButtons extends StatelessWidget {
  final Project project;

  const ProjectSocialButtons(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: [
        if (project.github.isNotEmpty)
          _ActionPill(
            icon: FontAwesomeIcons.github,
            label: AppLabels.github,
            onPressed: () => openUrl(project.github),
          ),
        if (project.web.isNotEmpty)
          _ActionPill(
            icon: FontAwesomeIcons.link,
            label: AppLabels.website,
            onPressed: () => openUrl(project.web),
          ),
        if (project.googlePlay.isNotEmpty)
          TextButton(
            onPressed: () => openUrl(project.googlePlay),
            child: Image.asset(
              'resources/images/google-play-pl.png',
              height: 36,
            ),
          ),
      ],
    );
  }
}

class _ActionPill extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ActionPill({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  State<_ActionPill> createState() => _ActionPillState();
}

class _ActionPillState extends State<_ActionPill> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.accent.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.border,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(999),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    widget.icon,
                    size: 14,
                    color: _hovered ? AppColors.accent : AppColors.textMuted,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 13,
                          color:
                              _hovered ? AppColors.accent : AppColors.textMuted,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
