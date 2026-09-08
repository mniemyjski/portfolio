import 'package:flutter/material.dart';

class PageSection extends StatelessWidget {
  final Widget child;

  const PageSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
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
}
