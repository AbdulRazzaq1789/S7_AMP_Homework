import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ArchivePlaceholder extends StatelessWidget {
  const ArchivePlaceholder({super.key, required this.onRestore});

  final VoidCallback onRestore;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('archived_placeholder'),
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 415),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppPalette.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 78,
            height: 78,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppPalette.paleGreen,
            ),
            child: const Icon(Icons.inventory_2_outlined,
                size: 36, color: AppPalette.green),
          ),
          const SizedBox(height: 23),
          const Text('Safely archived',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          const Text(
            'The product has been hidden as a demo action. '
            'You can bring it back instantly.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppPalette.muted, height: 1.5),
          ),
          const SizedBox(height: 25),
          FilledButton.icon(
            key: const Key('restore_product'),
            onPressed: onRestore,
            icon: const Icon(Icons.undo_rounded),
            label: const Text('Restore product'),
          ),
        ],
      ),
    );
  }
}
