import 'package:flutter/material.dart';

class PageSection extends StatelessWidget {
  final Widget child;
  final bool fullHeight;

  const PageSection({
    super.key,
    required this.child,
    this.fullHeight = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 1200,
          minHeight:
              fullHeight ? MediaQuery.of(context).size.height : 0,
        ),
        child: child,
      ),
    );
  }
}
