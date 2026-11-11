import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

/// A visible local theme override that does not change MaterialApp's global theme.
class LocalThemeCard extends StatefulWidget {
  const LocalThemeCard({super.key});

  @override
  State<LocalThemeCard> createState() => _LocalThemeCardState();
}

class _LocalThemeCardState extends State<LocalThemeCard> {
  bool _joined = false;

  @override
  Widget build(BuildContext context) {
    final inherited = Theme.of(context);
    final accent = inherited.brightness == Brightness.dark
        ? AppPalette.mintLight : AppPalette.mint;
    final localTheme = inherited.copyWith(
      colorScheme: inherited.colorScheme.copyWith(
        primary: accent,
        onPrimary: inherited.brightness == Brightness.dark
          ? const Color(0xFF073A30) : Colors.white,
      ),
    );
    // Descendants use green from this local Theme, while the app stays blue.
    return Theme(data: localTheme, child: Builder(builder: (themedContext) {
      final colors = Theme.of(themedContext).colorScheme;
      return Card(child: Padding(padding: const EdgeInsets.all(22), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.groups_2_outlined, color: colors.primary),
            const SizedBox(width: 10),
            Expanded(child: Text('Study circle', style: Theme.of(themedContext).textTheme.titleMedium)),
          ]),
          const SizedBox(height: 9),
          const Text('Connect with peers, practice Dart and share Flutter ideas.'),
          const SizedBox(height: 16),
          FilledButton.icon(
            key: const Key('study_circle_toggle'),
            onPressed: () => setState(() => _joined = !_joined),
            icon: Icon(_joined ? Icons.check_circle : Icons.group_add_outlined),
            label: Text(_joined ? 'Joined study circle' : 'Join study circle'),
          ),
          const SizedBox(height: 9),
          Text('Local Theme override • This card uses a green accent.',
            style: Theme.of(themedContext).textTheme.labelSmall?.copyWith(color: colors.primary)),
        ],
      )));
    }));
  }
}
