import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Static image preview. The full-size pinch viewer lives in a separate dialog
/// so horizontal swipes on the card do not compete with scale recognition.
class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.assetPath,
    required this.onOpenViewer,
  });

  final String assetPath;
  final VoidCallback onOpenViewer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      decoration: BoxDecoration(
        color: const Color(0xFFDAEAE2),
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF0F2E9), Color(0xFFC9DED2)],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Image.asset(
                assetPath,
                fit: BoxFit.contain,
                semanticLabel: 'Forma One over-ear headphones illustration',
              ),
            ),
          ),
          const Positioned(
            left: 18,
            top: 17,
            child: _EditionBadge(),
          ),
          Positioned(
            right: 14,
            bottom: 14,
            child: Material(
              color: AppPalette.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.small),
              ),
              child: InkWell(
                key: const Key('open_image_viewer'),
                borderRadius: BorderRadius.circular(AppRadius.small),
                onTap: onOpenViewer,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.zoom_out_map_rounded, size: 17),
                      SizedBox(width: 7),
                      Text('ZOOM', style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: .8,
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditionBadge extends StatelessWidget {
  const _EditionBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: AppPalette.white.withValues(alpha: .90),
        borderRadius: BorderRadius.circular(9),
      ),
      child: const Text(
        'EDITOR’S PICK',
        style: TextStyle(
          color: AppPalette.ink,
          fontSize: 10,
          fontWeight: FontWeight.w900,
          letterSpacing: .7,
        ),
      ),
    );
  }
}
