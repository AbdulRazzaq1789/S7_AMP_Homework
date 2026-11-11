import 'package:flutter/material.dart';

import '../controllers/product_demo_controller.dart';
import '../theme/app_theme.dart';

class GestureGuide extends StatelessWidget {
  const GestureGuide({
    super.key,
    required this.completed,
    required this.lastActivity,
  });

  final Set<DemoGesture> completed;
  final String lastActivity;

  @override
  Widget build(BuildContext context) {
    const List<_GestureInfo> items = <_GestureInfo>[
      _GestureInfo(DemoGesture.tap, '01', Icons.touch_app_outlined,
          'Single tap', 'Expand or collapse product details'),
      _GestureInfo(DemoGesture.doubleTap, '02', Icons.favorite_outline_rounded,
          'Double tap', 'Mark or unmark the product as favorite'),
      _GestureInfo(DemoGesture.longPress, '03', Icons.more_horiz_rounded,
          'Long press', 'Open the product action menu'),
      _GestureInfo(DemoGesture.swipe, '04', Icons.swipe_left_rounded,
          'Swipe left', 'Archive safely, with an Undo action'),
      _GestureInfo(DemoGesture.pinch, '05', Icons.zoom_out_map_rounded,
          'Pinch to zoom', 'Open ZOOM, then enlarge the picture'),
    ];

    return Container(
      padding: const EdgeInsets.all(AppSpace.lg),
      decoration: BoxDecoration(
        color: AppPalette.white,
        border: Border.all(color: AppPalette.border),
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Gesture checklist', style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                letterSpacing: -.4,
              )),
              Text('${completed.length}/5',
                key: const Key('completion_count'),
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppPalette.green,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Discover the five touch gestures from Lecture 07.',
            style: TextStyle(color: AppPalette.muted, fontSize: 13)),
          const SizedBox(height: 21),
          ...items.map((item) => _GestureTile(
            item: item,
            isComplete: completed.contains(item.gesture),
          )),
          const SizedBox(height: 16),
          Container(
            key: const Key('last_activity'),
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppPalette.paleGreen,
              borderRadius: BorderRadius.circular(AppRadius.small),
            ),
            child: Row(
              children: [
                const Icon(Icons.bolt_rounded,
                    color: AppPalette.green, size: 19),
                const SizedBox(width: 10),
                Expanded(child: Text(lastActivity,
                  style: const TextStyle(
                    color: AppPalette.ink, fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GestureInfo {
  const _GestureInfo(
      this.gesture, this.number, this.icon, this.title, this.subtitle);
  final DemoGesture gesture;
  final String number;
  final IconData icon;
  final String title;
  final String subtitle;
}

class _GestureTile extends StatelessWidget {
  const _GestureTile({required this.item, required this.isComplete});
  final _GestureInfo item;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: isComplete ? AppPalette.paleGreen : AppPalette.canvas,
              borderRadius: BorderRadius.circular(AppRadius.small),
            ),
            child: Icon(isComplete ? Icons.check_rounded : item.icon,
              color: AppPalette.green, size: 21),
          ),
          const SizedBox(width: 13),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900)),
              const SizedBox(height: 3),
              Text(item.subtitle,
                style: const TextStyle(color: AppPalette.muted,
                    fontSize: 12, height: 1.25)),
            ],
          )),
          const SizedBox(width: 8),
          Text(item.number,
            style: const TextStyle(color: AppPalette.muted,
              fontSize: 12, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
