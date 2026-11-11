import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.caption,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String value;
  final String caption;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final type = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: accent.withOpacity(.13),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(icon, color: accent, size: 22),
                ),
                const Spacer(),
                Icon(Icons.north_east_rounded,
                    size: 17, color: scheme.onSurfaceVariant),
              ],
            ),
            const SizedBox(height: 17),
            Text(value,
                style: type.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                )),
            const SizedBox(height: 2),
            Text(title,
                style: type.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 5),
            Text(caption,
                style: type.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
