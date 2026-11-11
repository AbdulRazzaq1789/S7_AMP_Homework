import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Action menu launched exclusively from a long press on the product card.
class ProductActionsSheet extends StatelessWidget {
  const ProductActionsSheet({
    super.key,
    required this.isSaved,
    required this.onSave,
    required this.onArchive,
  });

  final bool isSaved;
  final VoidCallback onSave;
  final VoidCallback onArchive;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 13, 20, 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Container(
              width: 42,
              height: 5,
              decoration: BoxDecoration(
                color: AppPalette.border,
                borderRadius: BorderRadius.circular(8),
              ),
            )),
            const SizedBox(height: 23),
            const Text('Product actions', style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w900)),
            const SizedBox(height: 5),
            const Text('Choose what you want to do with Forma One.',
              style: TextStyle(color: AppPalette.muted)),
            const SizedBox(height: 12),
            ListTile(
              leading: Icon(isSaved
                  ? Icons.bookmark_remove_outlined
                  : Icons.bookmark_add_outlined),
              title: Text(isSaved ? 'Remove from saved' : 'Save for later'),
              subtitle: const Text('Keep this item in your saved list'),
              onTap: onSave,
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2_outlined,
                  color: AppPalette.danger),
              title: const Text('Archive product'),
              subtitle: const Text('You can undo this action'),
              onTap: onArchive,
            ),
          ],
        ),
      ),
    );
  }
}
