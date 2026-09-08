import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/shared/config/app_labels.dart';
import 'package:portfolio/shared/config/app_links.dart';
import 'package:portfolio/shared/layout/page_section.dart';
import 'package:portfolio/shared/layout/responsive_layout.dart';
import 'package:portfolio/shared/theme/app_theme.dart';
import 'package:portfolio/shared/utils/open_url.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageSection(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ResponsiveLayout(
            desktop: _content(context, headlineSize: 56, alignCenter: false),
            mobile: _content(context, headlineSize: 40, alignCenter: true),
          ),
        ),
      ),
    );
  }

  Widget _content(
    BuildContext context, {
    required double headlineSize,
    required bool alignCenter,
  }) {
    final alignment =
        alignCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = alignCenter ? TextAlign.center : TextAlign.start;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: alignment,
        children: [
          Text(
            AppLabels.ownerName,
            textAlign: textAlign,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: headlineSize,
                  height: 1.1,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            AppLabels.role,
            textAlign: textAlign,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.accent,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              AppLabels.tagline,
              textAlign: textAlign,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            alignment: alignCenter ? WrapAlignment.center : WrapAlignment.start,
            children: [
              _SocialPillButton(
                icon: FontAwesomeIcons.github,
                label: AppLabels.github,
                onPressed: () => openUrl(AppLinks.github),
              ),
              _SocialPillButton(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                onPressed: () => openUrl(AppLinks.linkedIn),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialPillButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialPillButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  State<_SocialPillButton> createState() => _SocialPillButtonState();
}

class _SocialPillButtonState extends State<_SocialPillButton> {
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
              ? AppColors.accent.withValues(alpha: 0.16)
              : AppColors.surfaceElevated,
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
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    widget.icon,
                    size: 16,
                    color: _hovered ? AppColors.accent : AppColors.textPrimary,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    widget.label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color:
                              _hovered ? AppColors.accent : AppColors.textPrimary,
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
