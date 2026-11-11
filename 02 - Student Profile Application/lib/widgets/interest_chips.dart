import 'package:flutter/material.dart';

class InterestChips extends StatelessWidget {
  const InterestChips({super.key, required this.interests});
  final List<String> interests;

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 8, runSpacing: 8,
      children: interests.map((value) => Chip(label: Text(value),
        side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant))).toList(),
    );
  }
}
