import 'package:flutter/material.dart';

import '../controllers/xylophone_controller.dart';
import '../theme/app_theme.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({super.key, required this.controller});
  final XylophoneController controller;

  @override
  Widget build(BuildContext context) {
    final note = controller.lastNote;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPalette.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppPalette.border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('NOW PLAYING', style: TextStyle(fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.w800, color: AppPalette.muted)),
        const SizedBox(height: 13),
        Row(children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(color: (note?.color ?? AppPalette.turquoise).withValues(alpha: 0.16), borderRadius: BorderRadius.circular(17)),
            child: Icon(Icons.graphic_eq_rounded, size: 30, color: note?.color ?? AppPalette.turquoise),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(note?.label ?? 'Ready when you are', style: TextStyle(fontSize: note == null ? 16 : 28, fontWeight: FontWeight.w800, letterSpacing: -0.6)),
            const SizedBox(height: 3),
            Text(note == null ? 'Choose your first note' : '${note.solfege} · ${note.frequencyHz.toStringAsFixed(1)} Hz', style: const TextStyle(color: AppPalette.muted, fontSize: 12)),
          ])),
        ]),
        const SizedBox(height: 25),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('RECENT NOTES', style: TextStyle(fontSize: 10, letterSpacing: 1.6, fontWeight: FontWeight.w800, color: AppPalette.muted)),
          TextButton(
            key: const Key('clear-button'),
            onPressed: controller.recentNotes.isEmpty ? null : controller.clearHistory,
            child: const Text('Clear', style: TextStyle(fontSize: 12)),
          ),
        ]),
        const SizedBox(height: 4),
        SizedBox(
          height: 39,
          child: controller.recentNotes.isEmpty
              ? const Align(alignment: Alignment.centerLeft, child: Text('Your notes will appear here.', style: TextStyle(fontSize: 12, color: AppPalette.muted)))
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.recentNotes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 7),
                  itemBuilder: (context, index) {
                    final item = controller.recentNotes[index];
                    return Container(
                      width: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: item.color.withValues(alpha: 0.18), borderRadius: BorderRadius.circular(11), border: Border.all(color: item.color.withValues(alpha: 0.55))),
                      child: Text(item.label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: item.color)),
                    );
                  },
                ),
        ),
      ]),
    );
  }
}
