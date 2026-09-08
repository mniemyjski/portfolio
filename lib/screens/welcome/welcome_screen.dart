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
      begin: const Offset(0, 0.04),
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
    final viewportHeight = MediaQuery.sizeOf(context).height;
    final topInset = MediaQuery.paddingOf(context).top + 56;

    return PageSection(
      child: SizedBox(
        height: viewportHeight,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            topInset,
            AppSpacing.md,
            AppSpacing.xl,
          ),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: ResponsiveLayout(
                desktop: _desktopLayout(context),
                mobile: _mobileLayout(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1040),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: _heroContent(context, alignCenter: false),
            ),
            const SizedBox(width: AppSpacing.xl),
            const Expanded(
              flex: 4,
              child: _ProfileVisual(size: 260),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxHeight < 640;

        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ProfileVisual(size: compact ? 140 : 160),
                  SizedBox(height: compact ? AppSpacing.sm : AppSpacing.lg),
                  _heroContent(
                    context,
                    alignCenter: true,
                    headlineSize: compact ? 34 : 40,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _heroContent(
    BuildContext context, {
    required bool alignCenter,
    double? headlineSize,
  }) {
    final alignment =
        alignCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = alignCenter ? TextAlign.center : TextAlign.start;
    final resolvedHeadlineSize =
        headlineSize ?? (alignCenter ? 40.0 : 58.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignment,
      children: [
        Text(
          AppLabels.welcomeGreeting,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                letterSpacing: 0.2,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        _NameHeadline(
          alignCenter: alignCenter,
          fontSize: resolvedHeadlineSize,
        ),
        const SizedBox(height: AppSpacing.lg),
        _SkillsPanel(alignCenter: alignCenter),
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
    );
  }
}

class _ProfileVisual extends StatelessWidget {
  final double size;

  const _ProfileVisual({required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.accent.withValues(alpha: 0.5),
              AppColors.accent.withValues(alpha: 0.15),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.accent.withValues(alpha: 0.15),
              blurRadius: 32,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(3),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.surfaceElevated,
                AppColors.surface,
              ],
            ),
          ),
          child: Center(
            child: Text(
              'MN',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: size * 0.28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.accent,
                    letterSpacing: -1,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NameHeadline extends StatelessWidget {
  final bool alignCenter;
  final double fontSize;

  const _NameHeadline({
    required this.alignCenter,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: fontSize,
          height: 1.05,
          letterSpacing: -1.5,
          fontWeight: FontWeight.w700,
        );

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Marcel ',
            style: baseStyle?.copyWith(color: AppColors.textPrimary),
          ),
          TextSpan(
            text: 'Niemyjski',
            style: baseStyle?.copyWith(color: AppColors.accent),
          ),
        ],
      ),
      textAlign: alignCenter ? TextAlign.center : TextAlign.start,
    );
  }
}

class _SkillsPanel extends StatelessWidget {
  final bool alignCenter;

  const _SkillsPanel({required this.alignCenter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: alignCenter ? double.infinity : null,
      constraints: const BoxConstraints(maxWidth: 480),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm + 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment:
            alignCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            AppLabels.skillsSection,
            textAlign: alignCenter ? TextAlign.center : TextAlign.start,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.textMuted,
                  letterSpacing: 0.3,
                  fontSize: 13,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            alignment:
                alignCenter ? WrapAlignment.center : WrapAlignment.start,
            children: AppLabels.skills
                .map((skill) => _SkillChip(label: skill))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.chip),
        color: AppColors.accent.withValues(alpha: 0.1),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 13,
              color: AppColors.accent,
            ),
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
                          color: _hovered
                              ? AppColors.accent
                              : AppColors.textPrimary,
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
