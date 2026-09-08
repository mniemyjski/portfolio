import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/theme/app_theme.dart';

class PortfolioNavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onProjectsPressed;

  const PortfolioNavBar({
    super.key,
    required this.onHomePressed,
    required this.onProjectsPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.72),
            border: const Border(
              bottom: BorderSide(color: AppColors.border),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: 56,
              child: Row(
                children: [
                  Text(
                    AppLabels.ownerName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  _NavLink(
                    label: AppLabels.home,
                    onPressed: onHomePressed,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  _NavLink(
                    label: AppLabels.projects,
                    onPressed: onProjectsPressed,
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

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const _NavLink({
    required this.label,
    required this.onPressed,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          foregroundColor:
              _hovered ? AppColors.accent : AppColors.textPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
        ),
        child: Text(widget.label),
      ),
    );
  }
}
