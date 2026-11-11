import 'package:flutter/material.dart';
import 'spec_line.dart';

/// AnimatedContainer changes surface style and padding, while AnimatedSize
/// smoothly expands/collapses the actual content height.
class SpecificationsPanel extends StatefulWidget {
  const SpecificationsPanel({super.key});

  @override
  State<SpecificationsPanel> createState() => _SpecificationsPanelState();
}

class _SpecificationsPanelState extends State<SpecificationsPanel> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AnimatedSize(
      duration: const Duration(milliseconds: 340),
      curve: Curves.easeInOutCubic,
      alignment: Alignment.topCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 340),
        curve: Curves.easeInOutCubic,
        padding: EdgeInsets.all(_expanded ? 22 : 16),
        decoration: BoxDecoration(
          color: _expanded ? colors.primaryContainer : colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(_expanded ? 24 : 18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              button: true,
              expanded: _expanded,
              child: InkWell(
                key: const Key('specifications_toggle'),
                borderRadius: BorderRadius.circular(12),
                onTap: () => setState(() => _expanded = !_expanded),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(children: [
                    const Icon(Icons.tune_rounded),
                    const SizedBox(width: 10),
                    const Expanded(child: Text('Specifications',
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17))),
                    Icon(_expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                  ]),
                ),
              ),
            ),
            if (_expanded) ...[
              const Divider(height: 24),
              const SpecLine(label: 'Battery life', value: '30 hours'),
              const SpecLine(label: 'Connectivity', value: 'Bluetooth 5.3'),
              const SpecLine(label: 'Charging', value: 'USB-C'),
              const SpecLine(label: 'Noise cancelling', value: 'Adaptive ANC'),
            ],
          ],
        ),
      ),
    );
  }
}
