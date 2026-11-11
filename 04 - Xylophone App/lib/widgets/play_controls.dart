import 'package:flutter/material.dart';

import '../controllers/xylophone_controller.dart';
import '../theme/app_theme.dart';

class PlayControls extends StatelessWidget {
  const PlayControls({super.key, required this.controller});
  final XylophoneController controller;

  @override
  Widget build(BuildContext context) {
    final playing = controller.isDemoPlaying;
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            key: const Key('scale-button'),
            onPressed: !controller.isReady ? null : playing ? controller.stopScale : controller.playScale,
            style: FilledButton.styleFrom(
              backgroundColor: AppPalette.turquoise,
              foregroundColor: const Color(0xFF0A2530),
              padding: const EdgeInsets.symmetric(vertical: 17),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            icon: Icon(playing ? Icons.stop_rounded : Icons.play_arrow_rounded),
            label: Text(playing ? 'Stop scale' : 'Play the scale', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
          ),
        ),
        const SizedBox(width: 10),
        IconButton.filledTonal(
          key: const Key('mute-button'),
          onPressed: controller.toggleMute,
          tooltip: controller.isMuted ? 'Unmute sound' : 'Mute sound',
          icon: Icon(controller.isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded),
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(17),
            backgroundColor: AppPalette.surface,
            foregroundColor: AppPalette.cream,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }
}
