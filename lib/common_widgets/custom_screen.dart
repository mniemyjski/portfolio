import 'package:flutter/material.dart';
import 'package:portfolio/utilities/responsive.dart';

class CustomScreen extends StatelessWidget {
  final Widget child;

  const CustomScreen({this.child, Key key}) : super(key: key);

  _mobile(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200, minHeight: MediaQuery.of(context).size.height),
          child: child,
        ),
      ),
    );
  }

  _desktop(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200, minHeight: MediaQuery.of(context).size.height),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: _mobile(context), desktop: _desktop(context));
  }
}
