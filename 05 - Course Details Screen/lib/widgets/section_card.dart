import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Shared spacing/decorations used by content sections.
class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    this.subtitle,
  });

  final String title;
  final IconData icon;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppPalette.line),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Color(0x070E2746), blurRadius: 22,
              offset: Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF3FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppPalette.blue, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    if (subtitle != null) ...<Widget>[
                      const SizedBox(height: 3),
                      Text(subtitle!, style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
          child,
        ],
      ),
    );
  }
}
