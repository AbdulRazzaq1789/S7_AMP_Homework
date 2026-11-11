import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.title, this.subtitle});
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: Theme.of(context).textTheme.titleLarge),
      if (subtitle != null) ...[
        const SizedBox(height: 3),
        Text(subtitle!, style: const TextStyle(color: AppPalette.muted, fontSize: 13)),
      ],
    ],
  );
}
