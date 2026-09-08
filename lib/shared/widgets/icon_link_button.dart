import 'package:flutter/material.dart';

class IconLinkButton extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final VoidCallback onPressed;

  const IconLinkButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        color: color,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
