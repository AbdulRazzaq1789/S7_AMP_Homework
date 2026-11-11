import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class LabelPill extends StatelessWidget {
  const LabelPill({
    super.key,
    required this.label,
    this.icon,
    this.background = AppPalette.paleGreen,
    this.foreground = AppPalette.green,
  });

  final String label;
  final IconData? icon;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: foreground),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              color: foreground,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: .3,
            ),
          ),
        ],
      ),
    );
  }
}
