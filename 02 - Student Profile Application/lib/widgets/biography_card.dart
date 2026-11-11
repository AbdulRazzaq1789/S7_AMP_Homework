import 'package:flutter/material.dart';

import '../models/student.dart';

/// StatefulWidget example: setState expands/collapses the biography text.
class BiographyCard extends StatefulWidget {
  const BiographyCard({super.key, required this.student});
  final Student student;

  @override
  State<BiographyCard> createState() => _BiographyCardState();
}

class _BiographyCardState extends State<BiographyCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final description = _expanded
        ? '${widget.student.shortBiography} ${widget.student.extendedBiography}'
        : widget.student.shortBiography;
    return Card(
      child: Padding(padding: const EdgeInsets.all(22), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(Icons.auto_stories_outlined, color: theme.colorScheme.primary),
            const SizedBox(width: 10),
            Expanded(child: Text('About me', style: theme.textTheme.titleMedium)),
          ]),
          const SizedBox(height: 14),
          AnimatedSize(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: Text(description, key: const Key('biography_text'),
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.65)),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            key: const Key('biography_toggle'),
            onPressed: () => setState(() => _expanded = !_expanded),
            icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            label: Text(_expanded ? 'Show less' : 'Read more'),
          ),
        ],
      )),
    );
  }
}
