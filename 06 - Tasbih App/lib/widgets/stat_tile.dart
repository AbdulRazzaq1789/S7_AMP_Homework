import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(17),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppPalette.outline),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 21, color: AppPalette.jade),
        const SizedBox(height: 11),
        Text(value, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: AppPalette.ink)),
        const SizedBox(height: 3),
        Text(label, style: const TextStyle(fontSize: 12, color: AppPalette.muted)),
      ],
    ),
  );
}
