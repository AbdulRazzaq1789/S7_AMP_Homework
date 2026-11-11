import 'package:flutter/material.dart';

import '../controllers/xylophone_controller.dart';
import '../data/notes.dart';
import '../theme/app_theme.dart';
import 'note_bar.dart';

class InstrumentPanel extends StatelessWidget {
  const InstrumentPanel({super.key, required this.controller});

  final XylophoneController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPalette.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppPalette.border),
      ),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(color: AppPalette.turquoise.withValues(alpha: 0.13), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.piano_rounded, color: AppPalette.turquoise, size: 21),
                ),
                const SizedBox(width: 12),
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('THE INSTRUMENT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 2, color: AppPalette.muted)),
                  SizedBox(height: 3),
                  Text('C major · 7 notes', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                ])),
                Text('${controller.playCount} taps', style: const TextStyle(fontSize: 12, color: AppPalette.muted)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF0A1C2B), Color(0xFF0D2030)]),
              border: Border.all(color: AppPalette.border.withValues(alpha: 0.5)),
            ),
            child: Stack(
              children: [
                Positioned.fill(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Container(width: 9, decoration: BoxDecoration(color: const Color(0xFF1D3948), borderRadius: BorderRadius.circular(12))),
                    Container(width: 9, decoration: BoxDecoration(color: const Color(0xFF1D3948), borderRadius: BorderRadius.circular(12))),
                  ]),
                )),
                Column(children: [
                  for (var i = 0; i < kNotes.length; i++)
                    NoteBar(
                      note: kNotes[i],
                      index: i,
                      active: controller.lastNote?.id == kNotes[i].id,
                      enabled: controller.isReady,
                      onPressed: () => controller.playNote(kNotes[i]),
                    ),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.touch_app_outlined, size: 14, color: AppPalette.muted),
              SizedBox(width: 6),
              Flexible(child: Text('Tap any bar to play its note', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: AppPalette.muted))),
            ],
          ),
        ],
      ),
    );
  }
}
