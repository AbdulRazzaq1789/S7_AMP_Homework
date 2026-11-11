import 'package:flutter/material.dart';

import '../models/dhikr.dart';
import '../theme/app_theme.dart';

class DhikrSelector extends StatelessWidget {
  const DhikrSelector({super.key, required this.selectedId, required this.onChanged});

  final String selectedId;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 53,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: DhikrCatalog.items.length,
      separatorBuilder: (_, _) => const SizedBox(width: 9),
      itemBuilder: (context, index) {
        final dhikr = DhikrCatalog.items[index];
        final selected = dhikr.id == selectedId;
        return ChoiceChip(
          key: Key('dhikr_${dhikr.id}'),
          showCheckmark: false,
          selected: selected,
          label: Text(dhikr.name),
          onSelected: (_) => onChanged(dhikr.id),
          labelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: selected ? Colors.white : AppPalette.ink,
          ),
          backgroundColor: Colors.white,
          selectedColor: AppPalette.pine,
          side: BorderSide(color: selected ? AppPalette.pine : AppPalette.outline),
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
        );
      },
    ),
  );
}
