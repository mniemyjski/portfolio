import 'package:flutter/material.dart';
import 'package:portfolio/shared/theme/app_theme.dart';

class TagChip extends StatelessWidget {
  final String label;

  const TagChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.chip),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.35),
        ),
        color: AppColors.accent.withValues(alpha: 0.08),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 12,
              color: AppColors.accent,
            ),
      ),
    );
  }
}
