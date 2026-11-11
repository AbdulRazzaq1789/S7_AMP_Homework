import 'package:flutter/material.dart';

/// A real StatefulWidget to observe Hot Reload preserving its State object.
class HotReloadDemoCard extends StatefulWidget {
  const HotReloadDemoCard({super.key});

  @override
  State<HotReloadDemoCard> createState() => _HotReloadDemoCardState();
}

class _HotReloadDemoCardState extends State<HotReloadDemoCard> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // Edit this constant inside build() and Hot Reload; State is retained.
    const hotReloadHeadline = 'Small changes. Big progress.';
    final theme = Theme.of(context);
    return Card(child: Padding(padding: const EdgeInsets.all(22), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.bolt_outlined, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(child: Text('Hot Reload lab', style: theme.textTheme.titleMedium)),
        ]),
        const SizedBox(height: 11),
        const Text(hotReloadHeadline, key: Key('hot_reload_headline')),
        const SizedBox(height: 11),
        Text('Counter: $_counter', key: const Key('hot_reload_counter'),
          style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          key: const Key('hot_reload_increment'),
          onPressed: () => setState(() => _counter++),
          icon: const Icon(Icons.add), label: const Text('Increase counter'),
        ),
        const SizedBox(height: 10),
        Text('Change hotReloadHeadline in lib/widgets/hot_reload_demo_card.dart, then Hot Reload. The text changes but the counter remains.',
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
      ],
    )));
  }
}
