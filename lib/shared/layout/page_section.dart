import 'package:flutter/material.dart';
import 'package:portfolio/shared/layout/responsive_layout.dart';

class PageSection extends StatelessWidget {
  final Widget child;

  const PageSection({super.key, required this.child});

  Widget _mobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 1200,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 1200,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _mobileLayout(context),
      desktop: _desktopLayout(context),
    );
  }
}
